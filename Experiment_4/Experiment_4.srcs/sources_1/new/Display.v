`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/10/27 21:29:16
// Design Name:
// Module Name: Display
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


module Display(
    input [3:0] d0, d1, d2, d3, d4, d5, d6, d7,
    input clk, rstn,
    output reg [7:0] an,
    output reg [6:0] cn
  );

  reg pe;
  reg [3:0] d;
  wire yclk;//分频后的时钟信号
  wire [2:0] wq;

  FrequencyDivider #(20) FD(
                     .k (20'b0001_1000_0110_1010_0000),//设置刷新周期为1ms（频率为1000HZ）
                     .clk (clk),
                     .rstn (rstn),
                     .y (yclk)
                   );

  Counter #(3, 7) CNT(//计数器，因为刚好是以8为周期循环的所以不用重置
            .clk (yclk),//接入分频后的时钟信号
            .rstn (rstn),
            .pe (pe),
            .ce (1'b1),//始终计数
            .d (3'b111),
            .q (wq)
          );

  always @(*)
  begin//选择器，译码
    an = ~(8'b0000_0001 << wq);//用移位运算进行译码
    case(wq)//选择对应的输入信号
      3'b000:
        d = d0;
      3'b001:
        d = d1;
      3'b010:
        d = d2;
      3'b011:
        d = d3;
      3'b100:
        d = d4;
      3'b101:
        d = d5;
      3'b110:
        d = d6;
      3'b111:
        d = d7;
    endcase

    case(d)//显示译码
      4'b0000:
        cn = 7'b100_0000;
      4'b0001:
        cn = 7'b111_1001;
      4'b0010:
        cn = 7'b010_0100;
      4'b0011:
        cn = 7'b011_0000;
      4'b0100:
        cn = 7'b001_1001;
      4'b0101:
        cn = 7'b001_0010;
      4'b0110:
        cn = 7'b000_0010;
      4'b0111:
        cn = 7'b111_1000;
      4'b1000:
        cn = 7'b000_0000;
      4'b1001:
        cn = 7'b001_0000;
      4'b1010:
        cn = 7'b000_1000;
      4'b1011:
        cn = 7'b000_0011;
      4'b1100:
        cn = 7'b100_0110;
      4'b1101:
        cn = 7'b010_0001;
      4'b1110:
        cn = 7'b000_0110;
      4'b1111:
        cn = 7'b000_1110;
    endcase
  end
endmodule
