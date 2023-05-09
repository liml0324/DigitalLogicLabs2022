`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 21:15:25
// Design Name: 
// Module Name: MUX2_1
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


module MUX2_1#(
    parameter WIDTH = 5
)(
    input [WIDTH-1:0] din0, din1,
    input sel,
    output reg [WIDTH-1:0] dout
    );

    always @(*) begin
        if(!sel)    dout = din0;
        else        dout = din1;
    end
endmodule
