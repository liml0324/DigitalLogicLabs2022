`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 14:37:53
// Design Name: 
// Module Name: Adder_test_2
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


module Adder_test_2(
    input [7:0] a, b,
    input rstn, ci, clk, en,
    output [7:0] s,
    output co
    );
    wire [7:0] w_8_0, w_8_1, w_8_2;
    wire w_ci, w_co;
    register RG0(//输入加法器a的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (a),
        .q (w_8_0)
    );
    register RG1(//输入加法器b的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (b),
        .q(w_8_1)
    );
    register #(1) RG2(//连到加法器进位ci的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (ci),
        .q (w_ci)
    );
    register RG3(//输出加法器结果s的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (w_8_2),
        .q (s)
    );
    register #(1) RG4(//输出加法器进位co的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d(w_co),
        .q(co)
    );
    add8_2 ADD(
        .a (w_8_0),
        .b (w_8_1),
        .ci (w_ci),
        .s (w_8_2),
        .co (w_co)
    );
endmodule
