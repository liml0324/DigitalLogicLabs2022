`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:34:13
// Design Name: 
// Module Name: SQD_Moore
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


module SQD_Moore(
    input in,
    input clk,
    input rstn,
    output [4:0] cs,
    output out
    );
    wire [4:0] w_cs, w_ns;
    wire w_out;
    CLn_Moore CLn(
        .in (in),
        .cs (w_cs),
        .ns (w_ns)
    );
    SR_Moore SR(
        .ns (w_ns),
        .clk (clk),
        .rstn (rstn),
        .cs (w_cs)
    );
    CLo_Moore Clo(
        .ns (w_ns),
        .out (w_out)
    );
    OR_Moore OR(
        .in(w_out),
        .clk (clk),
        .rstn (rstn),
        .out (out)
    );

    assign cs = w_cs;
endmodule
