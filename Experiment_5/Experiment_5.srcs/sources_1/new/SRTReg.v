`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 20:27:00
// Design Name: 
// Module Name: SRTReg
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


module SRTReg(
    input clk, rstn,
    input clr, plus, minus, we,//plus控制ra自增，minus控制ra_end自减，we为写入使能
    input [15:0] rf0, rf1,//rf0和rf1分别用来暂存RF[ra]和RF[ra+1]
    output reg [4:0] ra, ra_end,
    output reg [15:0] rf0_o, rf1_o
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   begin
            ra <= 5'b0;
            ra_end <= 5'b11111;
            rf0_o <= 0;
            rf1_o <= 0;
        end
        else if(clr)    ra <= 0;
        else if(plus)   ra <= ra + 5'b00001;
        else if(minus)  ra_end <= ra_end - 5'b00001;
        else if(we) begin
            rf0_o <= rf0;
            rf1_o <= rf1;
        end
    end
endmodule
