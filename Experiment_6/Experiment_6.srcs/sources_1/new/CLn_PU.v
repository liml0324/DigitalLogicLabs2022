`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 20:49:41
// Design Name: 
// Module Name: CLn_PU
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


module CLn_PU(
    input move, drawed, draw, changeRGB,
    input [3:0] cs,
    input [14:0] waddr,
    output reg [3:0] ns
    );

    always @(*) begin
        case (cs)
            4'd0:   begin
                if(waddr < 15'd30000)   ns = 4'd1;
                else                    ns = 4'd2;
            end
            4'd1:   ns = 4'd0;
            4'd2:   ns = 4'd3;
            4'd3:   ns = 4'd4;
            4'd4:   begin
                if(!drawed && draw) ns = 4'd5;
                else if(move)       ns = 4'd6;
                else if(changeRGB)  ns = 4'd3;
                else                ns = 4'd4;
            end
            4'd5:   ns = 4'd4;
            4'd6:   begin
                if(!drawed) ns = 4'd7;
                else        ns = 4'd8;
            end
            4'd7:   ns = 4'd8;
            4'd8:   ns = 4'd9;
            4'd9:   ns = 4'd4;
            default:        ns = 4'd4;
        endcase
    end
endmodule
