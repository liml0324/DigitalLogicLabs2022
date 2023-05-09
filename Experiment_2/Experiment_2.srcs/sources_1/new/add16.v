`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:40:16
// Design Name: 
// Module Name: add16
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


module add16(
    input [15:0] a,b,
    input ci,
    output [15:0] s
    );
    wire cin;
    cl_add8 add0(
        .a (a[7:0]),
        .b (b[7:0]),
        .ci (ci),
        .s (s[7:0]),
        .co (cin)
    );

    cl_add8 add1(
        .a (a[15:8]),
        .b (b[15:8]),
        .ci (cin),
        .s (s[15:8]),
        .co ()
    );
endmodule
