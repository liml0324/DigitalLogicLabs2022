`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 16:46:19
// Design Name: 
// Module Name: Painting
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


module Painting(
    input draw, up, down, left, right, rstn, clk, white, draw_button,
    input [11:0] prgb,
    output hs, vs,
    output [11:0] rgb
    );

    wire we, pclk;
    wire [7:0] i, j;
    wire [11:0] wdata, rdata;
    wire [14:0] waddr, raddr;

    Debounce DB(//对绘画信号去抖动，产生写使能信号
      .x (draw | draw_button),//sw15和bntc均可产生写信号，方便单点写入
      .clk (clk),
      .rstn (rstn),
      .y  (we)
    );
  

    Painting_Unit PU(
        .up (up),
        .down (down),
        .left (left), 
        .right (right),
        .clk (clk),
        .rstn (rstn),
        .prgb (prgb),
        .white (white),
        .i (i),
        .j (j),
        .wdata (wdata),
        .waddr (waddr)
    );

    VRAM VRAM(
        .addra (waddr),
        .clka (clk),
        .dina (wdata),
        .wea (we),
        .addrb (raddr),
        .clkb (pclk),
        .doutb (rdata)
    );

    PCLK PCLK(
        .clk_in1 (clk),
        .clk_out1 (pclk)
    );

    DisplayUnit DU(
        .pclk (pclk),
        .rstn (rstn),
        .white (white),
        .i (i),
        .j (j),
        .rdata (rdata),
        .prgb (prgb),
        .hs (hs),
        .vs (vs),
        .rgb (rgb),
        .raddr (raddr)
    );
endmodule
