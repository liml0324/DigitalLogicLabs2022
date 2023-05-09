`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 20:50:17
// Design Name: 
// Module Name: CLo_PU
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


module CLo_PU(
    input [3:0] ns,
    output reg rst_waddr, busy, add_waddr, set_drawed, rst_drawed,
    output reg set_dir, move2dir, set_wdata, rst_wdata, we
    );
    always @(*) begin
        rst_waddr = 0;
        busy = 1;
        add_waddr = 0;
        set_drawed = 0;
        rst_drawed = 0;
        set_dir = 0;
        move2dir = 0;
        set_wdata = 0;
        rst_wdata = 0;
        we = 0;
        case (ns)
            4'd0:   we = 1;
            4'd1:   add_waddr = 1;
            4'd2:   rst_waddr = 1;
            4'd3:   begin
                set_wdata = 1;
                we = 1;
            end
            4'd4:   busy = 0;
            4'd5:   set_drawed = 1;
            4'd6:   set_dir = 1;
            4'd7:   begin
                rst_wdata = 1;
                we = 1;
            end
            4'd8:   move2dir = 1;
            4'd9:   begin
                set_wdata = 1;
                we = 1;
                rst_drawed = 1;
            end
            default: busy = 0;
        endcase
    end
endmodule
