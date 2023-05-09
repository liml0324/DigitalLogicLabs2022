`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 17:37:32
// Design Name: 
// Module Name: Mul
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


module Mul(//竖式乘法，将a与b的每一位相乘（与），得到的8个结果用16位加法器加起来
    input [7:0] a,b,
    output [15:0] y
    );

    wire [15:0] w0, w1, w2, w3, w4, w5; 

    add16 Madd0(//先将乘法得到的8个数两两相加
        .a ({8'b0, a & {8{b[0]}}}),
        .b ({7'b0, a & {8{b[1]}}, 1'b0}),
        .ci (1'b0),
        .s (w0)
    );
    add16 Madd1(//先将乘法得到的8个数两两相加
        .a ({5'b0, a & {8{b[3]}}, 3'b0}),
        .b ({6'b0, a & {8{b[2]}}, 2'b0}),
        .ci (1'b0),
        .s (w1)
    );
    add16 Madd2(//将两两相加后的结果再两两相加
        .a (w1),
        .b (w0),
        .ci (1'b0),
        .s (w2)
    );
    add16 Madd3(//先将乘法得到的8个数两两相加
        .a ({3'b0, a & {8{b[5]}}, 5'b0}),
        .b ({4'b0, a & {8{b[4]}}, 4'b0}),
        .ci (1'b0),
        .s (w3)
    );
    add16 Madd4(//将两两相加后的结果再两两相加
        .a (w3),
        .b (w5),
        .ci (1'b0),
        .s (w4)
    );
    add16 Madd5(//先将乘法得到的8个数两两相加
        .a ({1'b0, a & {8{b[7]}}, 7'b0}),
        .b ({2'b0, a & {8{b[6]}}, 6'b0}),
        .ci (1'b0),
        .s (w5)
    );
    add16 Madd6(//将最后的结果加起来
        .a (w4),
        .b (w2),
        .ci (1'b0),
        .s (y)
    );
endmodule
