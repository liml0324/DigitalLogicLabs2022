`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/28 07:59:56
// Design Name: 
// Module Name: DIS_tb
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


module DIS_tb();
    reg clk, rstn;
    reg [3:0] d0, d1, d2, d3, d4, d5, d6, d7;
    wire [7:0] an;
    wire [6:0] cn;
    Display DIS(
        .d0 (d0),
        .d1 (d1),
        .d2 (d2),
        .d3 (d3),
        .d4 (d4),
        .d5 (d5),
        .d6 (d6),
        .d7 (d7),
        .clk (clk),
        .rstn (rstn),
        .an (an),
        .cn (cn)
    );

    initial begin
        d0 = $random % 16;
        d1 = $random % 16;
        d2 = $random % 16;
        d3 = $random % 16;
        d4 = $random % 16;
        d5 = $random % 16;
        d6 = $random % 16;
        d7 = $random % 16;
        clk = 0;
        #1 rstn = 1'b0;
        #2000000 rstn = 1'b1;
        repeat(10)  begin
            #2000000    d0 = $random % 16;
                        d1 = $random % 16;
                        d2 = $random % 16;
                        d3 = $random % 16;
                        d4 = $random % 16;
                        d5 = $random % 16;
                        d6 = $random % 16;
                        d7 = $random % 16;
        end
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
