`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 20:15:32
// Design Name: 
// Module Name: Debounce
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


module Debounce(
    input x, clk, rstn,
    output reg y
    );

    wire [19:0] qHigh, qLow;

    Counter #(20, 20'b1111_0100_0010_0100_0000) CounterHigh(//处理高电平的计数器
        .clk(clk),
        .rstn (rstn),
        .pe (~x),//x为低电平时置数（重新计数）
        .ce (x), //x为高电平时计数
        .d (20'b1111_0100_0010_0100_0000),//1000000个周期后输出高电平
        .q (qHigh)
    );

    Counter #(20, 20'b1111_0100_0010_0100_0000) CounterLow(//处理低电平的计数器
        .clk(clk),
        .rstn (rstn),
        .pe (x), //x为高电平时置数（重新计数）
        .ce (~x),//x为低电平时计数
        .d (20'b1111_0100_0010_0100_0000),//1000000个周期后输出低电平
        .q (qLow)
    );

    always @(posedge clk, negedge rstn) begin
        if(!rstn)
            y = 0;
        else    begin
            if(qLow == 0)       y <= 0;//低电平计时结束后输出0
            else if(qHigh == 0) y <= 1;//高电平计时结束后输出1
            else                y <= y;
        end
    end
endmodule
