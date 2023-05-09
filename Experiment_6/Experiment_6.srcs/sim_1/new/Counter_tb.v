`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 16:33:57
// Design Name: 
// Module Name: Counter_tb
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


module Counter_tb();
    reg clk, rstn, pe, ce;
    wire [3:0] q;
    Counter #(4, 0, 10) CNT(
        .clk (clk),
        .rstn (rstn),
        .pe (pe),
        .ce (ce),
        .d (0),
        .q (q)
    );

    initial begin
        clk = 0; rstn = 0; pe = 0; ce = 0;
        #3 rstn = 1; pe = 1;
        #2 pe = 0; ce = 1;
    end

    always  #1 clk = ~clk;
endmodule
