`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 19:14:27
// Design Name: 
// Module Name: CU_CLo
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


module CU_CLo(//根据当前状态输出的组合电路
    input [3:0] ns,
    output reg [1:0] AR_mux, DR_mux,
    output reg AR_we, DR_we, RF_we
    );
    always @(*) begin
        AR_mux = 2'b00;
        DR_mux = 2'b11;
        AR_we = 0;
        DR_we = 0;
        RF_we = 0;
        case (ns)
            4'd0:    begin
                AR_mux = 2'b00;
                AR_we = 1;
                DR_we = 0;
                RF_we = 0;
            end 
            4'd1:    begin
                DR_mux = 2'b10;
                AR_we = 0;
                DR_we = 1;
                RF_we = 0;
            end
            4'd2:    begin
                AR_we = 0;
                DR_we = 0;
                RF_we = 0;
            end
            4'd3:   begin
                DR_mux = 2'b01;
                AR_we = 0;
                DR_we = 1;
                RF_we = 0;
            end
            4'd4:   begin
                DR_mux = 2'b00;
                AR_we = 0;
                DR_we = 1;
                RF_we = 0;
            end
            4'd5:   begin
                AR_we = 0;
                DR_we = 0;
                RF_we = 1;
            end
            4'd6:   begin
                AR_we = 0;
                DR_we = 0;
                RF_we = 1;
            end
            4'd7:   begin
                AR_mux = 2'b01;
                AR_we = 1;
                DR_we = 0;
                RF_we = 0;
            end
            4'd8:   begin
                AR_mux = 2'b10;
                AR_we = 1;
                DR_we = 0;
                RF_we = 0;
            end
            default:    begin
                AR_mux = 2'b00;
                DR_mux = 2'b11;
                AR_we = 0;
                DR_we = 0;
                RF_we = 0;
            end
        endcase
    end
endmodule
