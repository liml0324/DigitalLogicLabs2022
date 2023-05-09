`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 11:59:41
// Design Name: 
// Module Name: AddressRegister
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


module AddressRegister(
    input [4:0] din,
    input clk, rstn, we,
    output reg [4:0] dout
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   dout <= 0;
        else if(we) dout <= din;
    end
endmodule
