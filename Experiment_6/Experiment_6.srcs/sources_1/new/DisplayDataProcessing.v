`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 19:16:48
// Design Name: 
// Module Name: DisplayDataProcessing
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


module DisplayDataProcessing(
    input rstn, pclk, hen, ven,
    output reg rhen, rven,
    output [14:0] raddr
    );

    wire [9:0] j, i;//读取信号的坐标

    Counter #(10, 10'b0, 799) CNTj(
        .clk (pclk),//这里接pclk
        .rstn (rstn),
        .pe (1'b0),
        .ce (hen),//hen作为计数使能接入，在每个hen区间中j都会从0加到799再回到0
        .d (10'b0),
        .q (j)
    );

    Counter #(10, 10'b11_1111_1111, 599) CNTi(
        .clk (hen & ven),//将hen & ven作为时钟接入，让i在hen & ven上升沿时加1（由于当且仅当hen和ven均为1时才会输出有效的rgb信号，这样做不会有问题）
        .rstn (rstn),
        .pe (1'b0),
        .ce (1'b1),
        .d (10'b0),
        .q (i)
    );

    always @(posedge pclk) begin//寄存一级，使rhen和rven延迟一个时钟周期，与VRAM的读取和vs、hs信号对齐
        rhen <= hen;
        rven <= ven;
    end

    assign raddr = {7'b0, j[9:2]} + {i[9:2], 7'b0} + {1'b0, i[9:2], 6'b0} + {4'b0, i[9:2], 3'b0};//利用位拼接将坐标转换为读地址
endmodule
