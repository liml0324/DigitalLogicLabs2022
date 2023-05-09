`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 15:36:24
// Design Name: 
// Module Name: SR_Mealy
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


module SR_Mealy(
    input [1:0] ns,
    input clk, rstn,
    output [1:0] cs
    );
    D_Flipflop #(2) flipflop
    (//直接用一个触发器实现状态的存储和更新
        .d (ns),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (cs)
    );
endmodule
