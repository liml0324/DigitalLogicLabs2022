`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 16:42:23
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(
    input [3:0] a,
    input [3:0] b,
    input s,
    output reg [3:0] y
    );
    always @(*) begin
        case(s)
            1'b0: y = a;
            1'b1: y = b;
        endcase
    end
endmodule
