`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 22:27:59
// Design Name: 
// Module Name: GetEdge
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


module GetEdge(
    input x, clk, rstn,
    output reg y
    );
    reg prev;
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   begin
            prev <= 0;
            y <= 0;
        end
        else if(x != prev)  begin
            prev <= x;
            y <= 1;
        end
        else    y <= 0;
    end
endmodule
