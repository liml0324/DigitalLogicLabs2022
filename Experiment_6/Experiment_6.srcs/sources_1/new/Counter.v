`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 15:49:19
// Design Name: 
// Module Name: Counter
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


module Counter #(//计数器模块（老师给的
    parameter   WIDTH = 16,
                RST_VLU = 0,
                END_VLU = 1 << WIDTH - 1
)(
    input clk, rstn, pe, ce,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   q <= RST_VLU;
        else if(pe) q <= d;
        else if(q == END_VLU)   q <= d;
        else if(ce) q <= q + 1;
    end
endmodule
