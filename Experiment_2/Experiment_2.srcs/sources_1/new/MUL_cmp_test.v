`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/15 13:45:16
// Design Name: 
// Module Name: MUL_cmp_test
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


module MUL_cmp_test(
        input [7:0] a, b,
        input rstn, clk, en,
        output [15:0] y,
        output eq, ug, ul, sg, sl
    );
    wire [7:0] wa, wb;
    wire [15:0] wy;
    wire weq, wug, wul, wsg, wsl;
    register RG0(//输入a的寄存器
        .d (a),
        .en (en),
        .rstn (rstn),
        .clk (clk),
        .q (wa)
    );
    register RG1(//输入b的寄存器
        .d (b),
        .en (en),
        .rstn (rstn),
        .clk (clk),
        .q (wb)
    );
    register #(16) RG2(//输出y的寄存器
        .d (wy),
        .en (en),
        .rstn (rstn),
        .clk (clk),
        .q (y)
    );
    register #(5) RG3(//输出其它东西的寄存器
        .d ({weq, wug, wul, wsg, wsl}),
        .en (en),
        .rstn (rstn),
        .clk (clk),
        .q ({eq, ug, ul, sg, sl})
    );

    Mul MUL(//乘法器
        .a (wa),
        .b (wb),
        .y (wy)
    );

    cmp CMP(//比较器
        .a (wa),
        .b (wb),
        .ug (wug),
        .ul (wul),
        .sg (wsg),
        .sl (wsl)
    );

    assign weq = (wy == wa * wb);
endmodule
