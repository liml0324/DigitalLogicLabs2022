`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/16 11:30:51
// Design Name: 
// Module Name: OR_PU_CU
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


module OR_PU_CU(
    input clk, rstn, changeRGB_in, move_in,
    output reg changeRGB, move
    );

    always @(posedge clk, negedge rstn) begin
        if(!rstn)   begin
            changeRGB <= 0;
            move <= 0;
        end
        else        begin
            changeRGB <= changeRGB_in;
            move <= move_in;
        end
    end
endmodule
