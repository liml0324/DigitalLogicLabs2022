`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 20:36:00
// Design Name: 
// Module Name: Encoder
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


module Encoder(//时序译码器
    input [15:0] x,
    input clk, rstn,
    output reg [3:0] hd
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   hd = 4'h0;
        else if(x[15] == 1)  hd = 4'hF;
        else if(x[14] == 1) hd = 4'hE;
        else if(x[13] == 1) hd = 4'hD;
        else if(x[12] == 1) hd = 4'hC;
        else if(x[11] == 1) hd = 4'hB;
        else if(x[10] == 1) hd = 4'hA;
        else if(x[9] == 1) hd = 4'h9;
        else if(x[8] == 1) hd = 4'h8;
        else if(x[7] == 1) hd = 4'h7;
        else if(x[6] == 1) hd = 4'h6;
        else if(x[5] == 1) hd = 4'h5;
        else if(x[4] == 1) hd = 4'h4;
        else if(x[3] == 1) hd = 4'h3;
        else if(x[2] == 1) hd = 4'h2;
        else if(x[1] == 1) hd = 4'h1;
        else    hd = 4'h0;
    end
endmodule
