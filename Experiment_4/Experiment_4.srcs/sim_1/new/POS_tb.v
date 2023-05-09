`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 20:52:25
// Design Name: 
// Module Name: POS_tb
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


module POS_tb();
    reg s, clk;
    wire p;
    GetPosedge POS(
        .s (s),
        .clk (clk),
        .p (p)
    );

    initial begin
        s <= 0;
        clk <= 1;
        #2 s = 1;
        #14 s = 0;
        #3 s = 1;
    end

    always begin
        #1 clk <= ~clk;
    end
endmodule
