`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 19:55:33
// Design Name: 
// Module Name: DisplayUnit
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


module DisplayUnit(
    input pclk, rstn, white,
    input [7:0] i, j,//输入坐标i，j用来产生十字光标
    input [11:0] rdata, prgb,
    output hs, vs,
    output reg [11:0] rgb,
    output [14:0] raddr
    );

    wire hen, ven, rhen, rven;
    wire [7:0] iplus, iminus;//i+1和i-1
    reg [14:0] cursor_u, cursor_d, cursor_l, cursor_r, cursor;//存储光标位置的寄存器
    reg cross_en, cursor_en;//显示光标的使能

    DisplayDataProcessing DDP(
        .rstn (rstn),
        .pclk (pclk),
        .hen (hen),
        .ven (ven),
        .rhen (rhen),
        .rven (rven),
        .raddr (raddr)
    );

    DisplayScanTiming DST(
        .pclk (pclk),
        .rstn (rstn),
        .vs (vs),
        .hs (hs),
        .hen (hen),
        .ven (ven)
    );

    assign iplus = i + 8'd1;
    assign iminus = i - 8'd1;
    always @(posedge pclk) begin//需要显示十字光标的坐标
        cursor_u <= {iminus, 7'b0} + {1'b0, iminus, 6'b0} + {4'b0, iminus, 3'b0} + {7'b0, j};
        cursor_d <= {iplus, 7'b0} + {1'b0, iplus, 6'b0} + {4'b0, iplus, 3'b0} + {7'b0, j};
        cursor_l <= {i, 7'b0} + {1'b0, i, 6'b0} + {4'b0, i, 3'b0} + {7'b0, j - 1};
        cursor_r <= {i, 7'b0} + {1'b0, i, 6'b0} + {4'b0, i, 3'b0} + {7'b0, j + 1};
        cursor <= {i, 7'b0} + {1'b0, i, 6'b0} + {4'b0, i, 3'b0} + {7'b0, j};
    end
    

    always @(posedge pclk) begin//将产生光标的信号进行一级寄存，让它延后一个周期，和VRAM等对齐
        if( (raddr == cursor_u) && i != 0)    cross_en <= 1'b1;
        else if(raddr == cursor_d)      cross_en <= 1'b1;
        else if( (raddr == cursor_l) && j != 0) cross_en <= 1'b1;
        else if((raddr == cursor_r) && (j != 8'd199))  cross_en <= 1'b1;
        else    cross_en <= 1'b0;
    end

    always @(posedge pclk) begin//光标中心点，用于显示颜色
        if(raddr == cursor) cursor_en <= 1'b1;
        else    cursor_en <= 1'b0;
    end

    always @(*) begin//由于VRAM读取信息会延迟一个周期，这里也采用延迟了一个周期的rhen和rven控制是否显示颜色
        if(cursor_en)       rgb = (prgb | {12{white}}) & {12{rhen & rven}};//显示光标
        else if(cross_en)   rgb = 12'b0;//显示十字
        else                rgb = rdata & {12{rhen & rven}};//显示VRAM内容
    end

endmodule
