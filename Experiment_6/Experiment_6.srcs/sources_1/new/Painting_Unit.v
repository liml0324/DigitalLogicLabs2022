`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 16:20:14
// Design Name: 
// Module Name: Painting_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Painting_Unit(
    input up, down, left, right, rstn, clk,
    input [11:0] prgb,
    input white,//white有效时颜色强制置为白色，方便擦除
    output reg [7:0] i, j,//输出i，j，让DU用它们产生十字光标
    output [11:0] wdata,
    output [14:0] waddr
    );

    wire y, py, yclk, ok, pyclk;//y是将输入的所有方向信号或运算后再去抖动得到的信号，py是y的上升沿，yclk是分频器产生的连点信号，ok是开始连点的使能，pyclk是yclk的上升沿。
    wire [3:0] dir;//dir是方向信号
    assign waddr = {i, 7'b0} + {1'b0, i, 6'b0} + {4'b0, i, 3'b0} + {7'b0, j};

    assign wdata = prgb | {12{white}};

    Debounce Debounce_dut (//对输入信号进行去抖动
      .x (up | down | left | right),
      .clk (clk),
      .rstn (rstn),
      .y (y)
    );
  
    assign dir = ({up, down, left, right} & {4{py}}) | ({up, down, left, right} & {4{pyclk & ok}});//生成去抖动后带连点功能的方向信号

    AutoStopCounter #(26, 26'b10_1111_1010_1111_0000_1000_0000) AutoStopCounter_dut (//倒计时，计时结束后开始连点。
                                                                                    //这个计时器在计时结束后会自动停止，并持续产生计时结束信号。
      .clk (clk),
      .rstn (rstn),
      .pe (!y),//在y无效时置数，y有效时计数。
      .ce (y),
      .d (26'b10_1111_1010_1111_0000_1000_0000),
      .ok (ok)
    );
  
    FrequencyDivider #(24) FrequencyDivider_dut (//分频器，产生连点信号
      .k (23'b1001_1000_1001_0110_1000_000),
      .clk (clk),
      .rstn (rstn),
      .y (yclk)
    );

    GetPosedge GetPosedge_dut (//对连点信号取上升沿
      .s (yclk),
      .clk (clk),
      .p (pyclk)
    );

    GetPosedge GetPosedge_dut1 (//对去抖动后的信号取上升沿
      .s (y),
      .clk (clk),
      .p (py)
    );

    always @(posedge clk, negedge rstn) begin//处理光标移动
        if(!rstn)   begin
            i <= 8'd50;
            j <= 8'd50;
        end
        else begin
          if(dir[3]) begin
            if(i != 8'd0) i <= i - 8'd1;
            else          i <= 8'd149;
          end
          else if(dir[2])    begin
            if(i != 8'd149) i <= i + 8'd1;
            else            i <= 8'd0;
          end
          if(dir[1])  begin
            if(j == 8'd0) j <= 8'd199;
            else          j <= j - 8'd1;
          end
          else if(dir[0])   begin
            if(j == 8'd199) j <= 8'd0;
            else            j <= j + 8'd1;
          end
            
        end
    end

endmodule
