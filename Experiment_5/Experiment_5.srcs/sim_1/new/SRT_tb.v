`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 22:46:08
// Design Name: 
// Module Name: SRT_tb
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


module SRT_tb();
reg [15:0] x;
reg del, pre, nxt, exe, rstn, clk;
wire [7:0] an;
wire [6:0] cn;
wire busy;
wire [15:0] delay;

SRT SRT(
    .x (x),
    .del (del),
    .pre (pre),
    .nxt (nxt),
    .exe (exe),
    .rstn (rstn),
    .clk (clk),
    .an (an),
    .cn (cn),
    .busy (busy),
    .delay (delay)
);

initial begin
    clk = 0; rstn = 0; del = 0; pre = 0; nxt = 0; exe = 0; x = 0;
    #10 rstn = 1;
    #10 exe = 1;
    #2 exe = 0;
end

always begin
    #1 clk = ~clk;
end
endmodule
