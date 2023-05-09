`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 21:10:24
// Design Name: 
// Module Name: SRT_DB_PS
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


module SRT_DB_PS(
    input [15:0] x,
    input clk, rstn, nxt, pre, del, exe, busy,
    output [15:0] y,
    output ynxt, ypre, ydel, yexe
    );
    wire in, w, out;
    assign in = (|x) | nxt | pre | del | exe;
    Debounce DB(
        .x (in),
        .clk (clk),
        .rstn (rstn),
        .y (w)
    );
    GetPosedge PS(
        .s (w),
        .clk (clk),
        .p (out)
    );
    assign {y, ynxt, ypre, ydel, yexe} = {x, nxt, pre, del, exe} & {20{out & (~busy)}};//busy为0时才允许输入
endmodule
