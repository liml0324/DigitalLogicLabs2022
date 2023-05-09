`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 20:51:23
// Design Name: 
// Module Name: SR_PU
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


module SR_PU(
    input rstn, clk,
    input [3:0] ns,
    output reg [3:0] cs
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   cs <= 4'd0;
        else        cs <= ns;
    end
endmodule
