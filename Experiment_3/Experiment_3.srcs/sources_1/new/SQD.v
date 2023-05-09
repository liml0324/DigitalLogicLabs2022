`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:46:01
// Design Name: 
// Module Name: SQD
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


module SQD(
    input x, clk, rstn,
    output yl, yr,
    output [1:0] sl,
    output [4:0] sr,
    output [7:0] rx
    );
    SQD_Mealy Mealy(
        .in (x),
        .clk (clk),
        .rstn (rstn),
        .cs (sl),
        .out (yl)
    );

    SQD_Moore Moore(
        .in (x),
        .clk (clk),
        .rstn (rstn),
        .cs (sr),
        .out (yr)
    );

    ShiftReg shiftReg(
        .in (x),
        .clk (clk),
        .rstn (rstn),
        .out (rx)
    );
endmodule
