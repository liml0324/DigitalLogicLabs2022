`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 16:26:34
// Design Name: 
// Module Name: ECD10_4
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


module ECD10_4(
    input e,
    input [9:0] a,
    output reg f,
    output reg [3:0] y
    );
    always @(*) begin
        if (e == 1)  begin
            if (a[9] == 1)   y = 4'b1001;
            else if (a[8] == 1) y = 4'b1000;
            else if (a[7] == 1) y = 4'b0111;
            else if (a[6] == 1) y = 4'b0110;
            else if (a[5] == 1) y = 4'b0101;
            else if (a[4] == 1) y = 4'b0100;
            else if (a[3] == 1) y = 4'b0011;
            else if (a[2] == 1) y = 4'b0010;
            else if (a[1] == 1) y = 4'b0001;
            else    y = 4'b0000;
        end
        else
            y = 4'b0000;
        if (e == 1 && a != 0)   f = 1'b1;//f指示编码是否有效
        else    f = 1'b0;
    end
endmodule
