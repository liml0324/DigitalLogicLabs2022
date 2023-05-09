`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 22:51:23
// Design Name: 
// Module Name: DB_GE_tb
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


module DB_GE_tb();
    reg x, rstn, clk;
    wire y;
    DB_GE DB_GE(
        .x (x),
        .rstn (rstn),
        .clk (clk),
        .y (y)
    );
    initial begin
        x = 0; rstn = 0; clk = 0;
        #6 rstn = 1;
        repeat(10)
            #2 x = ~x;
        #2 x = 1;
        #2000000 x = 0;
        repeat(10)
            #2 x = ~x;
        #2 x = 0;
    end
    always begin
        #1 clk = ~clk;
    end
endmodule
