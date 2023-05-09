`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/28 09:16:55
// Design Name: 
// Module Name: Circuit0
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


module Circuit0(
    input x, rstn, clk, sel,
    output [7:0] an,
    output [6:0] cn
    );

    wire wy, wp, mux;
    wire [31:0] wq;

    Debounce DB(//按键去抖动
        .x (x),
        .clk (clk),
        .rstn (rstn),
        .y (wy)
    );

    assign mux = (~sel & x) | (sel & wy);//二选一选择器，选择是否去抖动

    GetPosedge PS(//取边沿
        .s (mux),
        .clk (clk),
        .p (wp)
    );

    Counter #(32, 32'hFF114514) CNT(//计数器，初始值为FF114514
        .clk (clk),
        .rstn (rstn),
        .pe (1'b0),
        .ce (wp),
        .d (32'b0),
        .q (wq)
    );

    Display DIS0(//显示译码器，连接数码管
        .d0 (wq[3:0]),
        .d1 (wq[7:4]),
        .d2 (wq[11:8]),
        .d3 (wq[15:12]),
        .d4 (wq[19:16]),
        .d5 (wq[23:20]),
        .d6 (wq[27:24]),
        .d7 (wq[31:28]), 
        .clk (clk),
        .rstn (rstn),
        .an (an),
        .cn (cn)
    );

endmodule
