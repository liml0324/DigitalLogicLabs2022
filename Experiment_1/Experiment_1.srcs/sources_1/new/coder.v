`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 18:35:42
// Design Name: 
// Module Name: coder
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


module coder(
    input e,
    input [9:0] a,
    input [3:0] b,
    output f,
    output [3:0] d,
    output [9:0] y,
    output [6:0] c,
    output dp,
    output [7:0] an
    );

    wire [3:0]Yecd;
    wire Fecd;
    wire [3:0]Ymux;
    wire [9:0]Ydcd;
    SDD sdd(
        .d (Ymux),
        .yn (c)
    );

    ECD10_4 ecd(
        .e (e),
        .a (a),
        .f (Fecd),
        .y (Yecd)
    );

    DCD4_10 dcd(
        .d (Ymux),
        .y (y)
    );

    mux2_1 mux(
        .b (Yecd),
        .a (b),
        .s (Fecd),
        .y (Ymux)
    );

    assign an = 8'b1111_1110;
    assign dp = 1'b1;
    assign d = Yecd;
    assign f = Fecd;

endmodule
