`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 17:51:43
// Design Name: 
// Module Name: DST_test
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


module DST_test(
    input clk, rstn, 
    output hen, ven, hs, vs,
    output [11:0] rgb
    );

    wire pclk;

    assign rgb = 12'hFFF & {12{hen & ven}};

    PCLK PCLK(
        .clk_in1 (clk),
        .clk_out1 (pclk)
    );

    DisplayScanTiming DST(
        .pclk (pclk),
        .rstn (rstn),
        .vs (vs),
        .hs (hs),
        .hen (hen),
        .ven (ven)
    );
endmodule
