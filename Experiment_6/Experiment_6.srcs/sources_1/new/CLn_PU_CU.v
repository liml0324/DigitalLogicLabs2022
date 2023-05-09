`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/16 11:30:06
// Design Name: 
// Module Name: CLn_PU_CU
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


module CLn_PU_CU(
    input busy, up, down, left, right,
    input [1:0] cs,
    input [11:0] prgb, wdata,
    output reg [1:0] ns
    );

    always @(*) begin
        case (cs)
            2'd0:   begin
                if(!busy && (up | down | left | right) )    ns = 2'd1;
                else if(!busy && prgb != wdata)             ns = 2'd2;
                else                                        ns = 2'd0;
            end 
            2'd1:   ns = 2'd0;
            2'd2:   ns = 2'd0;
            default: ns = 2'd0;
        endcase
    end
endmodule
