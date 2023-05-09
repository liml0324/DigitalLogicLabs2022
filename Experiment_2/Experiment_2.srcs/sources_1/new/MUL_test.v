`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/15 17:44:00
// Design Name: 
// Module Name: MUL_test
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


module MUL_test(
    input [7:0] a, b,
    input rstn, clk, en,
    output [15:0] y
    );
    wire [7:0] w_8_0, w_8_1;
    wire [15:0] w_16;
    wire w_ci, w_co;
    register RG0(//输入乘法器a的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (a),
        .q (w_8_0)
    );
    register RG1(//输入乘法器b的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (b),
        .q(w_8_1)
    );
    register #(16) RG3(//输出乘法器结果y的寄存器
        .clk (clk),
        .en (en),
        .rstn (rstn),
        .d (w_16),
        .q (y)
    );
    Mul MUL(
        .a (w_8_0),
        .b (w_8_1),
        .y (w_16)
    );
endmodule