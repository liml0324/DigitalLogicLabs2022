`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 20:34:13
// Design Name: 
// Module Name: SRT_CU
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


module SRT_CU(
    input [15:0] x, rd0, rd1,
    input rstn, clk, pre, nxt, del, exe,
    output [15:0] rf0, rf1, delay,
    output [4:0] ra,
    output [1:0] AR_mux, DR_mux, RF_wa_mux, RF_wd_mux,
    output AR_we, DR_we, RF_we, RF_ra0_mux, busy
    );

    wire [4:0] w_cs, w_ns, ra_end;
    wire [1:0] w_RF_wa_mux, w_RF_wd_mux, w_AR_mux, w_DR_mux;
    wire w_SRTReg_we, w_plus, w_minus, w_clr, w_SRTReg_rstn;
    wire w_ce, w_pe, w_AR_we, w_DR_we, w_RF_we;
    wire w_busy, w_RF_ra0_mux;


    SRT_CLn CLn(
        .x (x),
        .rf0 (rd0),
        .rf1 (rd1),
        .cs (w_cs),
        .ra_end (ra_end),
        .ra (ra),
        .pre (pre),
        .nxt (nxt),
        .del (del),
        .exe (exe),
        .ns (w_ns)
    );

    SRT_SR SR(
        .ns (w_ns),
        .clk (clk),
        .rstn (rstn),
        .cs (w_cs)
    );

    SRT_CLo CLo(
        .ns (w_ns),
        .AR_mux (w_AR_mux),
        .DR_mux (w_DR_mux),
        .AR_we (w_AR_we),
        .DR_we (w_DR_we),
        .RF_we (w_RF_we),
        .SRTReg_we (w_SRTReg_we),
        .plus (w_plus),
        .minus (w_minus),
        .clr (w_clr),
        .busy (w_busy),
        .SRTReg_rstn (w_SRTReg_rstn),
        .RF_ra0_mux (w_RF_ra0_mux),
        .RF_wa_mux (w_RF_wa_mux),
        .RF_wd_mux (w_RF_wd_mux),
        .pe (w_pe),
        .ce (w_ce)
    );

    wire SRTReg_we, plus, minus, clr, SRTReg_rstn, pe, ce;

    SRT_OR OR(
        .AR_mux (w_AR_mux),
        .DR_mux (w_DR_mux),
        .AR_we (w_AR_we),
        .DR_we (w_DR_we),
        .RF_we (w_RF_we),
        .SRTReg_we (w_SRTReg_we),
        .plus (w_plus),
        .minus (w_minus),
        .clr (w_clr),
        .busy (w_busy),
        .SRTReg_rstn (w_SRTReg_rstn),
        .RF_ra0_mux (w_RF_ra0_mux),
        .RF_wa_mux (w_RF_wa_mux),
        .RF_wd_mux (w_RF_wd_mux),
        .pe (w_pe),
        .ce (w_ce),
        .clk (clk),
        .rstn (rstn),
        .AR_mux_o (AR_mux),
        .DR_mux_o (DR_mux),
        .AR_we_o (AR_we),
        .DR_we_o (DR_we),
        .RF_we_o (RF_we),
        .SRTReg_we_o (SRTReg_we),
        .plus_o (plus),
        .minus_o (minus),
        .clr_o (clr),
        .busy_o (busy),
        .SRTReg_rstn_o (SRTReg_rstn),
        .RF_ra0_mux_o (RF_ra0_mux),
        .RF_wa_mux_o (RF_wa_mux),
        .RF_wd_mux_o (RF_wd_mux),
        .pe_o (pe),
        .ce_o (ce)
    );

    SRTReg SRTReg(
        .clk (clk),
        .rstn (rstn && SRTReg_rstn),
        .clr (clr),
        .plus (plus),
        .minus (minus),
        .we (SRTReg_we),
        .rf0 (rd0),
        .rf1 (rd1),
        .ra (ra),
        .ra_end (ra_end),
        .rf0_o (rf0),
        .rf1_o (rf1)
    );

    SRT_CNT CNT(
        .d (16'b0),
        .clk (clk),
        .rstn (rstn),
        .pe (pe),
        .ce (ce),
        .y (delay) 
    );
endmodule
