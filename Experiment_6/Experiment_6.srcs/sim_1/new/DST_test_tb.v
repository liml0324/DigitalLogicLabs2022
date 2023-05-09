`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 17:52:35
// Design Name: 
// Module Name: DST_test_tb
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


module DST_test_tb();
    reg clk, rstn;
    wire hen, ven, hs, vs;
    wire [11:0] rgb;

    DST_test DST_test(
        .clk (clk),
        .rstn (rstn),
        .hen (hen),
        .ven (ven),
        .vs (vs),
        .hs (hs),
        .rgb (rgb)
    );

    initial begin
        rstn = 0; clk = 1;
        #2 rstn = 1;
    end

    always #1 clk = ~clk;
endmodule
