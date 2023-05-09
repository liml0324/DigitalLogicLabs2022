`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 16:11:20
// Design Name: 
// Module Name: DB_PS
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


module DB_PS(
    input up, down, left, right, clk, rstn,
    output [3:0] dir
    );

    wire in, w, out;
    assign in = up | down | left | right;

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

    assign dir = {up, down, left, right} & {4{out}};
endmodule
