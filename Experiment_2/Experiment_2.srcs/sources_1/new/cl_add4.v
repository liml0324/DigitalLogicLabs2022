`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 14:31:47
// Design Name: 
// Module Name: cl_add4
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


module cl_add4(
    input [3:0] a, b,
    input ci,
    output [3:0] s,
    output co
    );
    wire [3:0] g, p, c;
    genvar i, j;
    assign g = a & b;
    assign p = a ^ b;
    assign c[0] = g[0] | p[0] & ci;//利用超前进位加法器的递推式生成加法器
    for(i = 1; i < 4; i = i + 1)  begin
        assign c[i] = g[i] | p[i] & c[i - 1];
    end
    assign s[0] = ci ^ p[0];
    assign s[3:1] = p[3:1] ^ c[2:0];
    assign co = c[3];
endmodule
