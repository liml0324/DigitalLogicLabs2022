`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 21:13:42
// Design Name: 
// Module Name: SRT
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


module SRT(
    input [15:0] x,
    input del, pre, nxt, exe, rstn, clk,
    output [7:0] an,
    output [6:0] cn,
    output busy,
    output [15:0] delay
    );

    wire [15:0] y, rd0, rd1, DRi, DRo, rf0, rf1, RF_wd;
    wire [4:0] ARi, ARo, ra, RF_wa, RF_ra0;
    wire [3:0] hd;
    wire [1:0] selAR, selDR, sel_RF_wa, sel_RF_wd;
    wire ynxt, ypre, ydel, yexe, weAR, weDR, weRF, sel_RF_ra0;

    SRT_DB_PS DB_PS(
        .x (x),
        .clk (clk),
        .rstn (rstn),
        .nxt (nxt),
        .pre (pre),
        .del (del),
        .exe (exe),
        .busy (busy),
        .y (y),
        .ynxt (ynxt),
        .ypre (ypre),
        .ydel (ydel),
        .yexe (yexe)
    );

    Encoder ECD(
        .x (y),
        .clk (clk),
        .rstn (rstn),
        .hd (hd)
    );

    MUX #(5) muxAR
    (
        .din0 (0),
        .din1 (ARo + 5'b00001),
        .din2 (ARo - 5'b00001),
        .din3 (0),
        .sel (selAR),
        .dout (ARi)
    );

    MUX #(16) muxDR(
        .din0 ({4'b0, DRo[15:4]}),//DR右移4位
        .din1 ({DRo[11:0], hd}),//DR左移4位加上hd
        .din2 (rd0),//寄存器堆的值
        .din3 (0),
        .sel (selDR),
        .dout (DRi)
    );

    DataRegister DR(
        .din (DRi),
        .clk (clk),
        .rstn (rstn),
        .we (weDR),
        .dout (DRo)
    );

    AddressRegister AR(
        .din (ARi),
        .clk (clk),
        .rstn (rstn),
        .we (weAR),
        .dout (ARo)
    );

    SRT_CU CU(
        .x (y),
        .rd0 (rd0),
        .rd1 (rd1),
        .rstn (rstn),
        .clk (clk),
        .pre (ypre),
        .nxt (ynxt),
        .del (ydel),
        .exe (yexe),
        .rf0 (rf0),
        .rf1 (rf1),
        .delay (delay),
        .ra (ra),
        .AR_mux (selAR),
        .DR_mux (selDR),
        .RF_wa_mux (sel_RF_wa),
        .RF_wd_mux (sel_RF_wd),
        .AR_we (weAR),
        .DR_we (weDR),
        .RF_we (weRF),
        .RF_ra0_mux (sel_RF_ra0),
        .busy (busy)
    );

    MUX #(5) muxWa(
        .din0 (ARo),
        .din1 (ra),
        .din2 (ra + 5'b00001),
        .din3 (0),
        .sel (sel_RF_wa),
        .dout (RF_wa)
    );

    MUX #(16) muxWd(
        .din0 (DRo),
        .din1 (rf0),
        .din2 (rf1),
        .din3 (0),
        .sel (sel_RF_wd),
        .dout (RF_wd)
    );

    MUX2_1 #(5) muxRa0(
        .din0 (ARo),
        .din1 (ra),
        .sel (sel_RF_ra0),
        .dout (RF_ra0)
    );

    RegisterFile RF(
        .clk (clk),
        .ra0 (RF_ra0),
        .ra1 (ra + 5'b00001),
        .wa (RF_wa),
        .wd (RF_wd),
        .we (weRF),
        .rd0 (rd0),
        .rd1 (rd1)
    );

    Display DIS(
        .clk (clk),
        .rstn (rstn),
        .d0 (DRo[3:0]),
        .d1 (DRo[7:4]),
        .d2 (DRo[11:8]),
        .d3 (DRo[15:12]),
        .d4 (0),
        .d5 (0),
        .d6 (ARo[3:0]),
        .d7 ({3'b0, ARo[4]}),
        .an (an),
        .cn (cn)
    );
endmodule
