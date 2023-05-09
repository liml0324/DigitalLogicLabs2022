`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 15:16:40
// Design Name: 
// Module Name: DU_test_tb
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


module DU_test_tb();

    reg clk, rstn;
    wire hs, vs;
    wire [11:0] rgb;

    DU_test DU_test(
        .clk (clk),
        .rstn (rstn),
        .hs (hs),
        .vs (vs),
        .rgb (rgb)
    );

    initial begin
        rstn = 0; clk = 0;
        #2 rstn = 1;
    end

    always #1 clk = ~clk;
endmodule
