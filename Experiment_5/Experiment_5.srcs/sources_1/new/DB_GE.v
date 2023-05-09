`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 22:47:44
// Design Name: 
// Module Name: DB_GE
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


module DB_GE(//先去抖动再取边沿
    input x, rstn, clk,
    output y
    );
    wire w;
    Debounce DB(
        .x (x),
        .clk (clk),
        .rstn (rstn),
        .y (w)
    );
    GetEdge GE(
        .x (w),
        .clk (clk),
        .rstn (rstn),
        .y (y)
    );
endmodule
