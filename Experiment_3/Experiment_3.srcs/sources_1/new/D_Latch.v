`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 15:22:22
// Design Name: 
// Module Name: D_Latch
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


module D_Latch#(parameter WIDTH = 1)
(
    input [WIDTH:0] d,
    input c,
    input rstn,
    output reg [WIDTH:0] q
    );
    always @(*) begin
        if(!rstn)   q <= 0;
        else if(c)  q <= d;
        else    q <= q;
    end
endmodule
