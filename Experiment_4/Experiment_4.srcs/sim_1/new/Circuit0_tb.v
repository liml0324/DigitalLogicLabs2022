`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/28 10:39:32
// Design Name: 
// Module Name: Circuit0_tb
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


module Circuit0_tb();
    reg x, rstn, clk, sel;
    wire [7:0] an;
    wire [6:0] cn;
    Circuit0 C(
        .x (x),
        .rstn (rstn),
        .clk (clk),
        .sel (sel),
        .an (an),
        .cn (cn)
    );

    initial begin
        x = 0; clk = 0; sel = 1;
        #1 rstn = 0;
        #2000000 rstn = 1;
        repeat(10)
            #1000000 x = 1;
            #2000000 x = 0;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
