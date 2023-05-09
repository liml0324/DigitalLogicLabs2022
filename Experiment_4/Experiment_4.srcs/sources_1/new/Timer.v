`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 17:17:23
// Design Name: 
// Module Name: Timer
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


module Timer #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] tc,
    input st, clk, rstn,
    output [WIDTH-1:0] q,
    output reg td
    );
    reg pe, ce;
    wire p;
    Counter #(WIDTH,0) CNT(//用来计时的计数器
        .d (tc),
        .clk (clk),
        .rstn (rstn),
        .pe (pe),
        .ce (ce),
        .q (q)
    );

    GetPosedge PS(//取st上升沿
        .s (st),
        .clk (clk),
        .p (p)
    );

    always @(*) begin//用组合电路处理置数和计时归零信号
        if(!rstn && clk)   begin
            pe = 0;
            td = 1;
        end
        else    begin
            pe = p;//置数信号直接取取边沿后的st
            if(q > 0)   td = 0;
            else        td = 1;
        end
    end

    always @(posedge clk) begin
        if(!rstn)
            ce = 0;
        else if(p)  begin//当st上升沿
            if(tc)  ce = 1;//输入不为0才设ce为1
            else    ce = 0;//否则ce置为0
        end
        else if(q <= 1)//计时停止会延迟一个周期，因此在q小于等于1时置ce为0
            ce = 0;
        else
            ce = ce;
    end
    
endmodule
