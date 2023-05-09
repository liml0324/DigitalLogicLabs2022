`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 17:26:35
// Design Name: 
// Module Name: DisplayScanTiming_tb
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


module DisplayScanTiming_tb();
    reg pclk, rstn;
    wire vs, hs, hen, ven;
    DisplayScanTiming DST(
        .pclk (pclk),
        .rstn (rstn),
        .vs (vs),
        .hs (hs),
        .hen (hen),
        .ven (ven)
    );

    initial begin
        pclk = 0; rstn = 0;
        #3 rstn = 1;
    end

    always begin
        #1 pclk = ~pclk;
    end
endmodule
