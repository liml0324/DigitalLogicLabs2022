`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 16:47:51
// Design Name: 
// Module Name: DisplayScanTiming
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


module DisplayScanTiming(
    input pclk, rstn,
    output reg vs, hs, hen, ven
    );

    wire [10:0] qhCNT;
    wire [9:0] qvCNT;

    Counter #(11, 0, 1039) hCNT(//产生行同步信号的计数器
        .clk (pclk),
        .rstn (rstn),
        .pe (0),
        .ce (1),
        .d (0),
        .q (qhCNT)
    );

    Counter #(10, 0, 666) vCNT(//产生场同步信号的计数器
        .clk (pclk),
        .rstn (rstn),
        .pe (0),
        .ce (qhCNT == 11'd1039),
        .d (0),
        .q (qvCNT)
    );

    always @(posedge pclk) begin//hs，由于存储器读取要延后一个时钟周期，这里的hs后移了一个时钟周期
        if(!rstn)               hs <= 0;
        else if(qhCNT == 11'd0)  hs <= 1;
        else if(qhCNT == 11'd120)   hs <= 0;
    end

    always @(posedge pclk) begin//hen
        if(!rstn)   hen <= 0;
        else if(qhCNT > 11'd182 && qhCNT < 11'd983)    hen <= 1;
        else    hen <= 0;
    end

    always @(posedge pclk) begin//vs，同样延后一个时钟周期
        if(!rstn)           vs <= 0;
        else if(qvCNT == 10'd666 && qhCNT == 11'd0)  vs <= 1;
        else if(qvCNT == 10'd6 && qhCNT == 11'd0)    vs <= 0;
    end

    always @(posedge pclk) begin//ven
        if(!rstn)   ven <= 0;
        else if(qvCNT > 10'd28 && qvCNT <= 10'd628)   ven <= 1;
        else    ven <= 0;
    end
endmodule
