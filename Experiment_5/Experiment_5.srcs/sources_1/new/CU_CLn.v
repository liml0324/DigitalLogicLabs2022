`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 18:07:33
// Design Name: 
// Module Name: CU_CLn
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


module CU_CLn(//维护状态的组合电路
    input [15:0] x,
    input [3:0] cs,
    input pre, nxt, del,
    output reg [3:0] ns
    );


    always @(*) begin
        ns = cs;
        case (cs)
            4'd0:   ns = 4'd1;
            4'd1:   ns = 4'd2;
            4'd2:    begin
                if(x)  ns = 4'd3;
                else if(nxt)    ns = 4'd5;
                else if(pre)    ns = 4'd6;
                else if(del)    ns = 4'd4;
                else            ns = 4'd2;
            end
            4'd3:   ns = 4'd2;
            4'd4:   ns = 4'd2;
            4'd5:   ns = 4'd7;
            4'd6:   ns = 4'd8;
            4'd7:   ns = 4'd1;
            4'd8:   ns = 4'd1;
            default:    ns = 4'b0000;
        endcase
    end
endmodule
