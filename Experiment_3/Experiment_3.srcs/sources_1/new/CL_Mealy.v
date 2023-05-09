`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 15:51:04
// Design Name: 
// Module Name: CL_Mealy
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


module CL_Mealy(
    input in,
    input [1:0] cs,//当前状态，2位顺序码
    output reg [1:0] ns,//下一个状态
    output reg out
    );
    always @(*) begin
        out = 0;//默认的输出和状态
        ns = cs;
        case(cs)//根据当前状态和输入决定输出和下一个状态
            2'b00:  begin
                out = 1'b0;
                if(in == 0) ns = 2'b00;
                else        ns = 2'b01;
            end
            2'b01:  begin
                out = 1'b0;
                if(in == 0) ns = 2'b00;
                else        ns = 2'b10;
            end
            2'b10:  begin
                out = 1'b0;
                if(in == 0) ns = 2'b11;
                else        ns = 2'b10;
            end
            2'b11:  begin
                if(in == 0) begin
                    ns = 2'b00;
                    out = 1'b0;
                end
                else        begin
                    ns = 2'b01;
                    out = 1'b1;
                end
            end
        endcase
    end
endmodule
