`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 16:53:32
// Design Name: 
// Module Name: DIO_DB_PS
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


module DIO_DB_PS(
    input [15:0] x,
    input clk, rstn, nxt, pre, del,
    output [15:0] y,
    output ynxt, ypre, ydel
    );
    wire in, w, out;
    assign in = (|x) | nxt | pre | del;
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
    assign {y, ynxt, ypre, ydel} = {x, nxt, pre, del} & {19{out}};
endmodule
