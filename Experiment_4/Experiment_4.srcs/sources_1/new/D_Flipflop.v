`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 20:44:32
// Design Name: 
// Module Name: D_Flipflop
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


module D_Flipflop#(parameter WIDTH = 1)
(
    input [WIDTH-1:0] d,
    input clk,
    output reg [WIDTH-1:0] q
    );
    always @(posedge clk) begin
        q <= d;
    end
endmodule