`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 15:31:05
// Design Name: 
// Module Name: D_Flipflop
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


module D_Flipflop#(parameter WIDTH = 1)
(
    input [WIDTH-1:0] d,
    input clk,
    input rstn,
    input [WIDTH-1:0] v_rstn,//用来重置触发器的变量，rstn为0时触发器内的值将被重置为这个值
    output reg [WIDTH-1:0] q
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   q <= v_rstn;
        else    q <= d;
    end
endmodule
