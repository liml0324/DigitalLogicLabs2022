`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/16 11:30:23
// Design Name: 
// Module Name: CLo_PU_CU
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


module CLo_PU_CU(
    input [1:0] ns,
    output reg changeRGB, move
    );

    always @(*) begin
        changeRGB = 0; move = 0;
        case (ns)
            2'd0:   ;
            2'd1:   move = 1;
            2'd2:   changeRGB = 1; 
            default: ;
        endcase
    end
endmodule
