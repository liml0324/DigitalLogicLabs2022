`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:29:13
// Design Name: 
// Module Name: OR_Moore
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


module OR_Moore(
    input in,
    input clk,
    input rstn,
    output out
    );
    D_Flipflop flipflop(
        .d (in),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q(out)
    );
endmodule
