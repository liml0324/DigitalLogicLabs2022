`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 15:25:01
// Design Name: 
// Module Name: cl_add8
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


module cl_add8(
    input [7:0] a, b,
    input ci,
    output [7:0] s,
    output co
    );
    wire [7:0] g, p, c;
    genvar i, j;
    assign g = a & b;
    assign p = a ^ b;
    assign c[0] = g[0] | p[0] & ci;//利用超前进位加法器的递推式生成加法器
    for(i = 1; i < 8; i = i + 1)  begin
        assign c[i] = g[i] | p[i] & c[i - 1];
    end
    assign s[0] = ci ^ p[0];
    assign s[7:1] = p[7:1] ^ c[6:0];
    assign co = c[7];
endmodule

// module c1_add8(
//     input [7:0] a,b,
//     input ci,
//     output [7:0] s,
//     output co
// );
//     wire [7:0] g, p, c;
//     genvar i;
//     assign g = a & b;
//     assign p = a ^ b;

//     assign c[0] = g[0] | p[0] & ci;
//     assign c[1] = g[1] | p[1] & g[0] | p[1] & p[0] & ci;
//     assign c[2] = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & ci;
//     assign c[3] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & p[0] & ci;
//     assign c[4] = g[4] | g[4] & g[3] | g[4] & p[3] & g[2] | g[4] & p[3] & p[2] & g[1] | g[4] & p[3] & p[2] & p[1] & g[0] | g[4] & p[3] & p[2] & p[1] & p[0] & ci;
//     assign c[5] = g[5] | g[5] & g[4] | g[5] & g[4] & g[3] | g[5] & g[4] & p[3] & g[2] | g[5] & g[4] & p[3] & p[2] & g[1] | g[5] & g[4] & p[3] & p[2] & p[1] & g[0] | g[5] & g[4] & p[3] & p[2] & p[1] & p[0] & ci;
//     assign c[6] = g[6] | g[6] & g[5] | g[6] & g[5] & g[4] | g[6] & g[5] & g[4] & g[3] | g[6] & g[5] & g[4] & p[3] & g[2] | g[6] & g[5] & g[4] & p[3] & p[2] & g[1] | g[6] & g[5] & g[4] & p[3] & p[2] & p[1] & g[0] | g[6] & g[5] & g[4] & p[3] & p[2] & p[1] & p[0] & ci;
//     assign c[7] = g[7] | g[7] & g[6] | g[7] & g[6] & g[5] | g[7] & g[6] & g[5] & g[4] | g[7] & g[6] & g[5] & g[4] & g[3] | g[7] & g[6] & g[5] & g[4] & p[3] & g[2] | g[7] & g[6] & g[5] & g[4] & p[3] & p[2] & g[1] | g[7] & g[6] & g[5] & g[4] & p[3] & p[2] & p[1] & g[0] | g[7] & g[6] & g[5] & g[4] & p[3] & p[2] & p[1] & p[0] & ci;
//     assign s[0] = p[0] ^ ci;
//     for(i = 1; i < 8; i = i + 1)    begin
//         assign s[i] = c[i-1] ^ p[i];
//     end
//     assign co = c[7];
// endmodule