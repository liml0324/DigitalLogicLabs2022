`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/22 14:43:22
// Design Name: 
// Module Name: SQD_Timing_tb
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


module SQD_Timing_tb();
    reg x, clk, rstn;
    wire yl, yr; 
    wire [1:0] sl;
    wire [4:0] sr;
    wire [7:0] rx;
    SQD sqd(
        .x(x),
        .clk (clk),
        .rstn (rstn),
        .yl (yl),
        .yr (yr),
        .sl (sl),
        .sr (sr),
        .rx (rx)
    );

    initial begin
        rstn = 0;
        clk = 0;
        x = 0;
        #200 rstn = 1;
        repeat(65536) begin
            #200 x = $random() % 2;
        end
    end

    always begin
        #100 clk = ~clk;
    end
endmodule
