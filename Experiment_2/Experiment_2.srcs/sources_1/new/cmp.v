`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:19:12
// Design Name: 
// Module Name: cmp
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


module cmp(
    input   [7:0] a, b,
    output        ug, ul, sg, sl
    );
    wire [15:0] w0, w1;

    add16 Uadd(//计算无符号a-b
        .a ({{8{1'b1}}, ~b}),//这里输入的是无符号b进行扩展后按位取反的结果
        .b ({{8{1'b0}},a}),//这里是扩展后的a
        .ci (1'b1),
        .s (w0)
    );

    add16 Sadd(//计算有符号a-b
        .a ({{8{~b[7]}}, ~b}),//这里输入的是b进行扩展后按位取反的结果
        .b ({{8{a[7]}},a}),//这里是扩展后的a
        .ci (1'b1),//加一个1
        .s (w1)
    );

    assign ug = ~w0[15] & (|w0);//计算结果不为0且最高位为0，则a>b
    assign ul = w0[15];//减法计算结果最高位为1，则表示a<b
    assign sg = ~w1[15] & (|w1);//计算结果不为0且最高位为0，则a>b
    assign sl = w1[15];//减法计算结果最高位为1，则表示a<b
endmodule
