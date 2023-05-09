`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:27:11
// Design Name: 
// Module Name: CLo_Moore
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


module CLo_Moore(
    input [4:0] ns,
    output reg out
    );
    always @(*) begin//只根据当前状态确定输出
        if(ns == 5'b10000)  out = 1;
        else                out = 0;
    end
endmodule
