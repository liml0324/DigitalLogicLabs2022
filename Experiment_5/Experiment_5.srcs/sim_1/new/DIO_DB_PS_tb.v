`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 17:27:27
// Design Name: 
// Module Name: DIO_DB_PS_tb
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


module DIO_DB_PS_tb();
    reg [15:0] x;
    reg clk, rstn, nxt, pre, del;
    wire [15:0] y;
    wire ynxt, ypre, ydel;
    DIO_DB_PS DDP(
        .x (x),
        .clk (clk),
        .rstn (rstn),
        .nxt (nxt),
        .pre (pre),
        .del (del),
        .y (y),
        .ynxt (ynxt),
        .ypre (ypre),
        .ydel (ydel)
    );
    initial begin
        rstn = 0; x = 0; clk = 0; nxt = 0; pre = 0; del = 0;
        #2 rstn = 1;
        repeat(10)
            #2 x[10] = ~x[10];
        #2 x[10] = 1;
        #2000020 x[10] = 0;
        repeat(10)
            #2 x[10] = ~x[10];
        #2 x[10] = 0;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
