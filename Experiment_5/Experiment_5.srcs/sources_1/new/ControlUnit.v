`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 17:56:48
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit( 
    input [15:0] x,
    input rstn, clk, pre, nxt, del,
    output [1:0] AR_mux, DR_mux,
    output AR_we, DR_we, RF_we
    );

    wire [3:0] w_cs, w_ns;
    wire [1:0] w_AR_mux, w_DR_mux;
    wire w_AR_we, w_DR_we, w_RF_we;
    CU_CLn CLn(
        .x (x),
        .cs (w_cs),
        .pre (pre),
        .nxt (nxt),
        .del (del),
        .ns (w_ns)
    );

    CU_SR SR(
        .ns (w_ns),
        .rstn (rstn),
        .clk (clk),
        .cs (w_cs)
    );

    CU_CLo CLo(
        .ns (w_ns),
        .AR_mux (w_AR_mux),
        .DR_mux (w_DR_mux),
        .AR_we (w_AR_we),
        .DR_we (w_DR_we),
        .RF_we (w_RF_we)
    );

    CU_OR OR(
        .AR_mux (w_AR_mux),
        .DR_mux (w_DR_mux),
        .AR_we (w_AR_we),
        .DR_we (w_DR_we),
        .RF_we (w_RF_we),
        .clk (clk),
        .rstn (rstn),
        .AR_mux_o (AR_mux),
        .DR_mux_o (DR_mux),
        .AR_we_o (AR_we),
        .DR_we_o (DR_we),
        .RF_we_o (RF_we)
    );
endmodule
