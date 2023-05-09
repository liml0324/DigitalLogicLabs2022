`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/15 19:12:27
// Design Name: 
// Module Name: MUL_cmp_test_tb
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


module MUL_cmp_test_tb();
    reg [7:0] a, b;
    reg rstn, clk, en;
    wire [15:0] y;
    wire eq, ug, ul, sg, sl;
    MUL_cmp_test ___(
        .a (a),
        .b (b),
        .rstn (rstn),
        .clk (clk),
        .en (en),
        .y (y),
        .eq (eq),
        .ug (ug),
        .ul (ul),
        .sg (sg),
        .sl (sl)
    );
    initial begin
        en = 1; rstn = 1; clk = 0; a = 0;
        repeat (256) begin
            b = 0;
            repeat(256) begin
                #2  b = b + 1;
            end
            a = a + 1;
        end
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
