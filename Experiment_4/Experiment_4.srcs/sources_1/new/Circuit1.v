`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/28 12:37:26
// Design Name: 
// Module Name: Circuit1
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


module Circuit1(
    input [15:0] din,
    input st, rstn, clk,
    output [7:0] an,
    output [6:0] cn,
    output td,
    output wy//去抖动后的置数信号
    );

    wire yclk;
    wire [25:0] wq;
    reg [15:0] rq;

    FrequencyDivider #(24) FD(
        .k (24'b0001_0111_1101_0111_1000),//用分频器把时钟周期设为1/1024s
        .clk (clk),
        .rstn (rstn),
        .y (yclk)
    );

    Debounce DB(//按键去抖动
        .x (st),
        .clk (clk),
        .rstn (rstn),
        .y (wy)
    );

    Timer #(26) timer(//计时器,精确到1/1024s。timer的时钟周期不能太慢，否则置数等操作时会出问题
        .tc ({din, 10'b0}),
        .st (wy),
        .clk (yclk),
        .rstn (rstn),
        .q (wq),
        .td (td)
    );

    always @(*) begin
        if(!rstn)   rq = 16'b0;
        else if(wq > 0) rq = wq[25:10] + 16'b1;//当wq不为0时，取它的前16位+1（相当于向上取整）
        else        rq = 16'b0;//wq为0时置为0
    end

    Display DIS(//以秒为单位输出
        .d0 (rq[3:0]),
        .d1 (rq[7:4]),
        .d2 (rq[11:8]),
        .d3 (rq[15:12]),
        .d4 (0),
        .d5 (0),
        .d6 (0),
        .d7 (0),
        .clk (clk),
        .rstn (rstn),
        .an (an),
        .cn (cn)
    );
endmodule