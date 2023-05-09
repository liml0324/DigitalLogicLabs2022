`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 20:17:31
// Design Name: 
// Module Name: SRT_OR
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


module SRT_OR(
    input [1:0] AR_mux, DR_mux, RF_wa_mux, RF_wd_mux,
    input AR_we, DR_we, RF_we, SRTReg_we, plus, minus, clr, busy,
    input SRTReg_rstn, RF_ra0_mux, pe, ce,
    input clk, rstn,
    output reg [1:0] AR_mux_o, DR_mux_o, RF_wa_mux_o, RF_wd_mux_o,
    output reg AR_we_o, DR_we_o, RF_we_o, SRTReg_we_o, plus_o, minus_o, 
    output reg clr_o, busy_o, SRTReg_rstn_o, RF_ra0_mux_o, pe_o, ce_o
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   begin
            AR_mux_o <= 2'b00;
            DR_mux_o <= 2'b11;
            AR_we_o <= 0;
            DR_we_o <= 0;
            RF_we_o <= 0;
            SRTReg_we_o <= 0;
            plus_o <= 0;
            minus_o <= 0;
            clr_o <= 0;
            busy_o <= 0;
            SRTReg_rstn_o <= 1;
            RF_ra0_mux_o <= 0;
            RF_wa_mux_o <= 0;
            RF_wd_mux_o <= 0;
            pe_o <= 0;
            ce_o <= 0;
        end
        else    begin
            AR_mux_o <= AR_mux;
            DR_mux_o <= DR_mux;
            AR_we_o <= AR_we;
            DR_we_o <= DR_we;
            RF_we_o <= RF_we;
            SRTReg_we_o <= SRTReg_we;
            plus_o <= plus;
            minus_o <= minus;
            clr_o <= clr;
            busy_o <= busy;
            SRTReg_rstn_o <= SRTReg_rstn;
            RF_ra0_mux_o <= RF_ra0_mux;
            RF_wa_mux_o <= RF_wa_mux;
            RF_wd_mux_o <= RF_wd_mux;
            pe_o <= pe;
            ce_o <= ce;
        end
    end
endmodule
