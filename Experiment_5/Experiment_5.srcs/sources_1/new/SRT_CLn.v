`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 16:52:17
// Design Name: 
// Module Name: SRT_CLn
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


module SRT_CLn(//维护状态的组合电路
    input [15:0] x, rf0, rf1,//rf0和rf1是RF中ra和ra+1对应位置的值
    input [4:0] cs,
    input [4:0] ra_end, ra,
    input pre, nxt, del, exe,
    output reg [4:0] ns
    );


    always @(*) begin//状态转换规则与状态机状态转换图一致
        ns = cs;
        case (cs)
            5'd0:   ns = 5'd1;
            5'd1:   ns = 5'd2;
            5'd2:    begin
                if(x)  ns = 4'd3;
                else if(nxt)    ns = 5'd5;
                else if(pre)    ns = 5'd6;
                else if(del)    ns = 5'd4;
                else if(exe)    ns = 5'd9;
                else            ns = 5'd2;
            end
            5'd3:   ns = 5'd2;
            5'd4:   ns = 5'd2;
            5'd5:   ns = 5'd7;
            5'd6:   ns = 5'd8;
            5'd7:   ns = 5'd1;
            5'd8:   ns = 5'd1;
            5'd9:   ns = 5'd10;
            5'd10:   begin
                if(!ra_end) ns = 5'd1;
                else        ns = 5'd11;
            end
            5'd11:  begin
                if(rf0 <= rf1)  ns = 5'd15;
                else            ns = 5'd12;
            end
            5'd12:  ns = 5'd13;
            5'd13:  ns = 5'd14;
            5'd14:  ns = 5'd15;
            5'd15:  begin
                if(ra < ra_end - 5'b00001) ns = 5'd11;
                else            ns = 5'd16;
            end
            5'd16:  ns = 5'd10;
            default:    ns = 5'd0;
        endcase
    end
endmodule
