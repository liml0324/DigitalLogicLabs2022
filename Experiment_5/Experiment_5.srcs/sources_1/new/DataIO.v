`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 21:56:48
// Design Name: 
// Module Name: DataIO
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


module DataIO(
    input [15:0] x,
    input del, pre, nxt, rstn, clk,
    output [7:0] an,
    output [6:0] cn
    );

    wire [15:0] wy, wDRi, wDRo, wRF;
    wire [4:0] wARi, wARo;
    wire [3:0] whd;
    wire [1:0] wselAR, wselDR;
    wire wynxt, wypre, wydel, weAR, weDR, weRF;

    DIO_DB_PS DB_PS(
        .x (x),
        .clk (clk),
        .rstn (rstn),
        .nxt (nxt),
        .pre (pre),
        .del (del),
        .y (wy),
        .ynxt (wynxt),
        .ypre (wypre),
        .ydel (wydel)
    );

    Encoder ECD(
        .x (wy),
        .clk (clk),
        .rstn (rstn),
        .hd (whd)
    );

    MUX #(5) muxAR
    (
        .din0 (0),
        .din1 (wARo + 5'b00001),
        .din2 (wARo - 5'b00001),
        .din3 (0),
        .sel (wselAR),
        .dout (wARi)
    );

    MUX #(16) muxDR(
        .din0 ({4'b0, wDRo[15:4]}),//DR右移4位
        .din1 ({wDRo[11:0], whd}),//DR左移4位加上hd
        .din2 (wRF),//寄存器堆的值
        .din3 (0),
        .sel (wselDR),
        .dout (wDRi)
    );

    DataRegister DR(
        .din (wDRi),
        .clk (clk),
        .rstn (rstn),
        .we (weDR),
        .dout (wDRo)
    );

    AddressRegister AR(
        .din (wARi),
        .clk (clk),
        .rstn (rstn),
        .we (weAR),
        .dout (wARo)
    );

    RegisterFile RF(
        .clk (clk),
        .ra0 (wARo),
        .ra1 (0),
        .wa (wARo),
        .wd (wDRo),
        .we (weRF),
        .rd0 (wRF),
        .rd1 ()
    );

    Display DIS(
        .clk (clk),
        .rstn (rstn),
        .d0 (wDRo[3:0]),
        .d1 (wDRo[7:4]),
        .d2 (wDRo[11:8]),
        .d3 (wDRo[15:12]),
        .d4 (0),
        .d5 (0),
        .d6 (wARo[3:0]),
        .d7 ({3'b0, wARo[4]}),
        .an (an),
        .cn (cn)
    );

    ControlUnit CU(
        .x (wy),
        .rstn (rstn),
        .clk (clk),
        .pre (wypre),
        .nxt (wynxt),
        .del (wydel),
        .AR_mux (wselAR),
        .DR_mux (wselDR),
        .AR_we (weAR),
        .DR_we (weDR),
        .RF_we (weRF)
    );
endmodule
