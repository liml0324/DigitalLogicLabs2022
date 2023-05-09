`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 21:01:58
// Design Name: 
// Module Name: SRT_CNT
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


module SRT_CNT#(
    parameter RST_VLU = 0
)(
    input [15:0] d,
    input clk, rstn, pe, ce,
    output reg [15:0] y
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   y <= RST_VLU;
        else if(pe) y <= d;
        else if(ce) y <= y + 1;
    end
endmodule
