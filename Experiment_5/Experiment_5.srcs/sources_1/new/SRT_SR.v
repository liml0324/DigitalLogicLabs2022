`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 18:17:36
// Design Name: 
// Module Name: SRT_SR
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


module SRT_SR(
    input [4:0] ns,
    input clk, rstn,
    output reg [4:0] cs
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   cs <= 5'b0;
        else        cs <= ns;
    end
endmodule
