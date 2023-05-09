`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 15:51:17
// Design Name: 
// Module Name: DCD4_10
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


module DCD4_10(
    input [3:0] d,//四位BCD码
    input v,
    output reg [9:0] y//十位译码，高电平有效
    );
    always @(*) begin
        if(v == 1 && d <= 4'b1001)
            y = 1 << d;
        else
            y = 0;
    end
endmodule
