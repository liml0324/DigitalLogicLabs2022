`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 16:45:49
// Design Name: 
// Module Name: SDD
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


module SDD(
    input [3:0] d,
    output reg [6:0] yn
    );

    always @(*) begin
        case(d)
            4'b0000: yn = 7'b1000000;
            4'b0001: yn = 7'b1111001;
            4'b0010: yn = 7'b0100100;
            4'b0011: yn = 7'b0110000;
            4'b0100: yn = 7'b0011001;
            4'b0101: yn = 7'b0010010;
            4'b0110: yn = 7'b0000010;
            4'b0111: yn = 7'b1111000;
            4'b1000: yn = 7'b0000000;
            4'b1001: yn = 7'b0010000;
            default: yn = 7'b1111111;
        endcase
    end
endmodule
