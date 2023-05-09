`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 21:51:32
// Design Name: 
// Module Name: AutoStopCounter
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


module AutoStopCounter #(
parameter   WIDTH = 16,
            RST_VLU = 0
)(
input clk, rstn, pe, ce,
input [WIDTH-1:0] d,
output reg ok
);

reg [WIDTH-1:0] q;

always @(posedge clk, negedge rstn) begin
    if(!rstn)   q <= RST_VLU;
    else if(pe) q <= d;
    else if(ce && q != 0) q <= q - 1;//等于0时停下来
end

always @(posedge clk, negedge rstn) begin//等于0时输出计时结束信号
    if(!rstn)   ok <= 0;
    else if(~(|q))  ok <= 1;
    else        ok <= 0;
end
endmodule
