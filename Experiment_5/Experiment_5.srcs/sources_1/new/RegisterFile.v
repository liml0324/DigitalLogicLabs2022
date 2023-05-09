`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 21:45:56
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile# (
    parameter AW = 5,		//地址宽度
    parameter DW = 16		//数据宽度
)(
    input clk,			//时钟
    input [AW-1:0] ra0, ra1,		//读地址
    output [DW-1:0] rd0, rd1, 	//读数据
    input [AW-1:0] wa,		//写地址
    input [DW-1:0] wd,		//写数据
    input we			//写使能
);
    reg [DW-1:0] rf [0: (1<<AW)-1];		//寄存器堆
    assign rd0 = rf[ra0], rd1 = rf[ra1];	//读操作
    always @ (posedge clk)
        if (we)  rf[wa]  <=  wd;		//写操作

    initial begin:label//initial置入一些值，方便测试
        integer i;
        for(i = 0; i < 1<<AW; i = i + 1)
            rf[i] = 16'hFFFF - i << 1;
    end
endmodule