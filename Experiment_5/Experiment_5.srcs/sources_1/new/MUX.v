`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 11:41:06
// Design Name: 
// Module Name: MUX
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


module MUX#(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] din0, din1, din2, din3,
    input [1:0] sel,
    output reg [WIDTH-1:0] dout
);
    always @(*) begin
        case (sel)
            2'b00:  dout = din0;
            2'b01:  dout = din1;
            2'b10:  dout = din2; 
            2'b11:  dout = din3;
        endcase
    end
endmodule
