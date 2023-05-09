`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/16 11:30:36
// Design Name: 
// Module Name: SR_PU_CU
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


module SR_PU_CU(
    input clk, rstn,
    input [1:0] ns,
    output reg [1:0] cs
    );

    always @(posedge clk, negedge rstn) begin
        if(!rstn)   cs <= 2'd0;
        else        cs <= ns;
    end
endmodule
