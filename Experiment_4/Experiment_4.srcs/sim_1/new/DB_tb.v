`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 20:28:42
// Design Name: 
// Module Name: DB_tb
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


module DB_tb();
    reg x, clk, rstn;
    wire y;
    Debounce DB(
        .x (x),
        .clk (clk),
        .rstn (rstn),
        .y (y)
    );

    initial begin
        #2 rstn = 0;
        #4 x = 0; clk = 0; rstn = 1;
        repeat(17)  begin
            #2 x = ~x;
        end

        #2 x = 1;

        #2000000 x = 0;
        repeat(23)  begin
            #2 x = ~x;
        end

        x = 0;
    end

    always  begin
        #1 clk = ~clk;
    end
endmodule
