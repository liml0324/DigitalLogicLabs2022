`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 20:09:07
// Design Name: 
// Module Name: PaintingUnit
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


module PaintingUnit(
    input draw, rstn, clk, up, down, left, right,
    input [11:0] prgb,
    output [14:0] waddr,
    output [11:0] wdata,
    output we
    );

    wire move, drawed, changeRGB;
    wire rst_waddr, busy_in, busy_out, add_waddr, set_drawed, rst_drawed;
    wire set_dir, move2dir, set_wdata, rst_wdata, we_in;
    wire [1:0] CU_cs, CU_ns;
    wire [3:0] cs, ns;

    CLn_PU CLn_PU(
        .move (move),
        .drawed (drawed),
        .draw (draw),
        .changeRGB (changeRGB),
        .cs (cs),
        .waddr (waddr),
        .ns (ns)
    );

    SR_PU SR_PU(
        .rstn (rstn),
        .clk (clk),
        .ns (ns),
        .cs (cs)
    );

    CLo_PU CLo_PU(
        .ns (ns),
        .rst_waddr (rst_waddr),
        .busy (busy_in),
        .add_waddr (add_waddr),
        .set_drawed (set_drawed),
        .rst_drawed (rst_drawed),
        .set_dir (set_dir),
        .move2dir (move2dir),
        .set_wdata (set_wdata),
        .rst_wdata (rst_wdata),
        .we (we_in)
    );

    OR_PU OR_PU(
        .clk (clk),
        .rstn (rstn),
        .rst_waddr (rst_waddr),
        .busy_in (busy_in),
        .add_waddr (add_waddr),
        .set_drawed (set_drawed),
        .rst_drawed (rst_drawed),
        .set_dir (set_dir),
        .move2dir (move2dir),
        .set_wdata (set_wdata),
        .rst_wdata (rst_wdata),
        .we_in (we_in),
        .up (up),
        .down (down),
        .left (left),
        .right (right),
        .prgb (prgb),
        .drawed (drawed),
        .we (we),
        .busy (busy_out),
        .wdata (wdata),
        .waddr (waddr)
    );

    CLn_PU_CU CLn_PU_CU(
        .busy (busy_out),
        .up (up),
        .down (down),
        .left (left),
        .right (right),
        .cs (CU_cs),
        .prgb (prgb),
        .wdata (wdata),
        .ns (CU_ns)
    );

    CLo_PU_CU CLo_PU_CU(//暂时先用2段式（3段式可能会出问题）
        .ns (CU_ns),
        .changeRGB (changeRGB),
        .move (move)
    );

    SR_PU_CU SR_PU_CU(
        .clk (clk),
        .rstn (rstn),
        .ns (CU_ns),
        .cs (CU_cs)
    );
endmodule
