`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 14:49:36
// Design Name: 
// Module Name: DU_test
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


module DU_test(
    input clk, rstn,
    output hs, vs,
    output [11:0] rgb
    );

    wire pclk;
    wire [11:0] rdata;
    wire [14:0] raddr;

    PCLK PCLK(
        .clk_in1 (clk),
        .clk_out1 (pclk)
    );

    DisplayUnit DU(
        .pclk (pclk),
        .rstn (rstn),
        .rdata (rdata),
        .i (8'b0),
        .j (8'b0),
        .prgb (12'h0F0),
        .hs (hs),
        .vs (vs),
        .rgb (rgb),
        .raddr (raddr)
    );

    VRAM VRAM(
        .addra (0),
        .clka (clk),
        .dina (12'h00F),
        .wea (0),
        .addrb (raddr),
        .clkb (pclk),
        .doutb (rdata)
    );
endmodule
