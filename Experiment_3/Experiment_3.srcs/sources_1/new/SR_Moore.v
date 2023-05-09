`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:16:06
// Design Name: 
// Module Name: SR_Moore
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

//独热码
module SR_Moore(
    input [4:0] ns,
    input clk,
    input rstn,
    output [4:0]cs
    );
    D_Flipflop #(5) flipflop
    (
        .d (ns),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (5'b00001),
        .q (cs)
    );
endmodule
