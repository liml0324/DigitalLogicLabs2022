`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 20:45:44
// Design Name: 
// Module Name: GetPosedge
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


module GetPosedge(//照老师给的电路做的
    input s, clk,
    output reg p
    );

    reg q;

    always @(posedge clk) begin
        q <= s;
        p = s & (~q);
    end
endmodule
