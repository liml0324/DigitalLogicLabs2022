`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/28 13:46:09
// Design Name: 
// Module Name: Circuit1_tb
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


module Circuit1_tb();

    reg st, clk, rstn;
    wire [7:0] an;
    wire td;

    Circuit1 C(
        .din (10),
        .st (st),
        .rstn (rstn),
        .clk (clk),
        .an (an),
        .cn (cn),
        .td (td)
    );

    initial begin
        st = 0; clk = 0; rstn = 0;
        #2 rstn = 1; st = 1;
        #20000000 st = 0;
        #4000000 rstn = 0;
        #1000000 rstn = 1;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
