`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:05:46
// Design Name: 
// Module Name: SQD_Mealy
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


module SQD_Mealy(
    input in,
    input clk,
    input rstn,
    output [1:0] cs,
    output out
    );
    wire [1:0] w_cs, w_ns;
    SR_Mealy SR(
        .ns (w_ns),
        .clk (clk),
        .rstn (rstn),
        .cs (w_cs)
    );

    CL_Mealy CL(
        .in (in),
        .cs (w_cs),
        .ns (w_ns),
        .out (out)
    );

    assign cs = w_cs;
endmodule
