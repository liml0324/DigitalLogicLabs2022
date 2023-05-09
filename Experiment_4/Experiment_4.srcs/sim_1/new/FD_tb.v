`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 17:08:24
// Design Name: 
// Module Name: FD_tb
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


module FD_tb();
    reg clk, rstn;
    reg [7:0] k;
    wire y;

    FrequencyDivider FD(
        .k (k),
        .rstn (rstn),
        .clk (clk),
        .y (y)
    );
    initial begin
        clk = 0; k = 2;
        #1 rstn = 0;
        #4 rstn = 1;
        #28 k = 5;
        #24 rstn = 0;
        #2 rstn = 1;
        #29 k = 7;
        #30 k = 2;
    end
    always begin
        #1 clk = ~clk;
    end
endmodule
