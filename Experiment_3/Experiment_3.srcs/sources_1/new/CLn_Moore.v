`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 16:18:43
// Design Name: 
// Module Name: CLn_Moore
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


module CLn_Moore(
    input in,
    input [4:0] cs,//5位独热码
    output reg [4:0] ns
    );
    always @(*) begin
        ns = 5'b00001;//默认的下一个状态
        case(cs)//根据当前状态和输入决定下一个状态
            5'b00001:   begin
                if(in == 0) ns = 5'b00001;
                else        ns = 5'b00010;
            end
            5'b00010:   begin
                if(in == 0) ns = 5'b00001;
                else        ns = 5'b00100;
            end
            5'b00100:   begin
                if(in == 0) ns = 5'b01000;
                else        ns = 5'b00100;
            end
            5'b01000:   begin
                if(in == 0) ns = 5'b00001;
                else        ns = 5'b10000;
            end
            5'b10000:   begin
                if(in == 0) ns = 5'b00001;
                else        ns = 5'b00100;
            end
        endcase
    end
endmodule
