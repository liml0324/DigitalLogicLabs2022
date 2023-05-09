`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/15 11:26:21
// Design Name: 
// Module Name: Adder_test_tb
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


module Adder_test_tb();
    reg [7:0] a, b;
    wire [7:0] s;
    reg rstn, ci, clk, en;
    wire co;
    Adder_test Adder_test_test(
        .a (a),
        .b (b),
        .rstn (rstn),
        .ci (ci),
        .clk (clk),
        .en (en),
        .s (s),
        .co (co)
    );

    initial begin
        /* change switch for 10 times */
        a = 0; b = 0; en = 1; rstn = 1; clk = 0; ci = 0;
        repeat(255) begin
                #1 b = b + 2;
                #1 a = a + 1;
        end 
        /* add switch for 10 times */
    end
    always begin
        #1 clk = ~clk;
    end
endmodule
