`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 11:57:00
// Design Name: 
// Module Name: DataRegister
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


module DataRegister(
    input [15:0] din,
    input clk, rstn, we,//we为写入使能
    output reg [15:0] dout
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   dout <= 0;
        else if(we) dout <= din;
    end
endmodule
