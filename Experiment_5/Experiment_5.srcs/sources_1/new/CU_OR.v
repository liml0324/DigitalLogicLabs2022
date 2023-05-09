`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 19:19:35
// Design Name: 
// Module Name: CU_OR
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


module CU_OR(
    input [1:0] AR_mux, DR_mux,
    input AR_we, DR_we, RF_we, clk, rstn,
    output reg [1:0] AR_mux_o, DR_mux_o,
    output reg AR_we_o, DR_we_o, RF_we_o
    );
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   begin
            AR_mux_o <= 2'b00;
            DR_mux_o <= 2'b10;
            AR_we_o <= 0;
            DR_we_o <= 0;
            RF_we_o <= 0;
        end
        else    begin
            AR_mux_o <= AR_mux;
            DR_mux_o <= DR_mux;
            AR_we_o <= AR_we;
            DR_we_o <= DR_we;
            RF_we_o <= RF_we;
        end
    end
endmodule
