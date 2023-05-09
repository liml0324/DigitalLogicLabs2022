`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 14:33:43
// Design Name: 
// Module Name: add8_2
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


module add8_2(
    input [7:0] a, b,
    input ci,
    output [7:0] s,
    output co
    );

    wire w;
    cl_add4 ADD0(
        .a (a[3:0]),
        .b (b[3:0]),
        .ci (ci),
        .s (s[3:0]),
        .co (w)
    );

    cl_add4 ADD1(
        .a (a[7:4]),
        .b (b[7:4]),
        .ci (w),
        .s (s[7:4]),
        .co (co)
    );
endmodule
