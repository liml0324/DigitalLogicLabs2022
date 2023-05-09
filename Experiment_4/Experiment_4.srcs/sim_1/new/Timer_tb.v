`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 18:16:34
// Design Name: 
// Module Name: Timer_tb
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


module Timer_tb();

reg st, clk, rstn;
reg [7:0] tc;
wire [7:0] q;
wire td;

    Timer timer(
        .tc(tc),
        .st (st),
        .clk (clk),
        .rstn (rstn),
        .q (q),
        .td (td)
    );

    initial begin
        st = 0;
        tc = 8'b0000_1000;
        clk = 1;
        #1 rstn = 0;
        #4 rstn = 1; st = 1;
        #2 st = 0;
        #10 rstn = 0;
        #2 rstn = 1; tc = 8'b0100_0001;
        #2 st = 1;
        #2 st = 0;

    end
    always begin
        #1 clk = ~clk;
    end
endmodule
