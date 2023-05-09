`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 20:52:24
// Design Name: 
// Module Name: OR_PU
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


module OR_PU(
    input rst_waddr, busy_in, add_waddr, clk, rstn, set_drawed, rst_drawed,
    input set_dir, up, down, left, right, move2dir, set_wdata, rst_wdata,
    input we_in,
    input [11:0] prgb,
    output reg drawed,
    output reg we, busy,
    output reg [11:0] wdata,
    output reg [14:0] waddr
    );

    reg [7:0] i, j;
    reg [3:0] dir;

    always @(posedge clk, negedge rstn) begin
        if(!rstn || rst_drawed) drawed <= 0;
        else if(set_drawed)     drawed <= 1;
    end

    always @(posedge clk, negedge rstn) begin
        if(!rstn)           dir <= 4'b0;
        else if(set_dir)    dir <= {up, down, left, right};
    end

    always @(posedge clk, negedge rstn) begin
        if(!rstn)           waddr <= 15'b0;
        else if(rst_waddr)  begin//将waddr和对应的坐标i，j重置到(50,50)
            i <= 8'd50; j <= 8'd50;
            waddr <= 15'd10050;
        end
        else if(add_waddr)  waddr <= waddr + 1;
        else if(move2dir)   begin
            if(dir[3] && i > 8'b0) begin//向上
                i <= i - 8'b1;
                waddr <= waddr - 15'd200;
            end
            else if(dir[2] && i < 8'd149)   begin//向下
                i <= i + 8'b1;
                waddr <= waddr + 15'd200;
            end
            else if(dir[1] && j > 8'b0) begin//向左
                j <= j - 8'b1;
                waddr <= waddr - 15'b1;
            end
            else if(dir[0] && j < 8'd199)   begin//向右
                j <= j + 8'b1;
                waddr <= waddr + 15'b1;
            end
        end
    end

    always @(posedge clk, negedge rstn) begin
        if(!rstn || rst_wdata)  wdata <= 12'hFFF;
        else if(set_wdata)      wdata <= prgb;
    end

    always @(posedge clk, negedge rstn) begin
        if(!rstn)   busy <= 0;
        else        busy <= busy_in;
    end

    always @(posedge clk, negedge rstn) begin
        if(!rstn)   we <= 1;//rstn时要清空画板，因此允许写入
        else        we <= we_in;
    end
endmodule
