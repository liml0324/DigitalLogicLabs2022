`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 17:58:50
// Design Name: 
// Module Name: CU_SR
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


module CU_SR(
    input [3:0] ns,
    input rstn, clk,
    output reg [3:0] cs
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   cs <= 4'b0;
        else        cs <= ns;
    end
endmodule
