`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:48:29
// Design Name: 
// Module Name: ShiftReg
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


module ShiftReg(
    input in,
    input clk,
    input rstn,
    output [7:0] out
    );
    wire [6:0] w;
    D_Flipflop F0(
        .d (in),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[0])
    );
    D_Flipflop F1(
        .d (w[0]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[1])
    );
    D_Flipflop F2(
        .d (w[1]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[2])
    );
    D_Flipflop F3(
        .d (w[2]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[3])
    );
    D_Flipflop F4(
        .d (w[3]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[4])
    );
    D_Flipflop F5(
        .d (w[4]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[5])
    );
    D_Flipflop F6(
        .d (w[5]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (w[6])
    );
    D_Flipflop F7(
        .d (w[6]),
        .clk (clk),
        .rstn (rstn),
        .v_rstn (0),
        .q (out[7])
    );
    assign out[6:0] = w;
endmodule
