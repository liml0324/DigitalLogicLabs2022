`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 16:10:32
// Design Name: 
// Module Name: FrequencyDivider
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


module FrequencyDivider#(
    parameter kWIDTH = 8
)(
    input [kWIDTH-1:0] k,
    input clk,
    input rstn,
    output reg y
    );

    reg pe;
    reg [kWIDTH-1:0] prevk;//存储上一个k的值，用来检测k的变化
    wire [kWIDTH-1:0] wq, one;
    assign one[0] = 1;
    assign one[kWIDTH-1:1] = 0;

    MinusCounter #(kWIDTH, 1) CNT(//由于设置的是计数器的值等于1时再次置数，将RST_VLU设为1
        .clk (clk),
        .rstn (rstn),
        .d (k - one),//从k-1开始计时（因为会计到0）
        .pe (pe),
        .ce (1'b1),
        .q (wq)
    );
    
    always @(posedge clk, negedge rstn) begin
        if(!rstn)   begin
            pe <= 0;
            prevk <= 0;
        end
        else if( (k != prevk || wq == 1) && !pe) begin//当k发生变化或者计数器倒计到1时，重新置数并更新prevk。为防止重复置数，只有在pe不等于1时才能置数
            pe <= 1;
            prevk <= k;
        end
        else//否则不置数
            pe <= 0;
    end

    always @(posedge clk, negedge rstn) begin
        if(!rstn || k != prevk)
            y <= 0;
        else if(wq == {1'b0, k[kWIDTH-1 : 1]})//会延后一个周期，实际是wq = k/2-1时y置1。这里的除是整除
            y <= 1;
        else if(wq == 0)//实际是计数器被置为k-1时y置0
            y <= 0;
        else
            y <= y;
    end
endmodule
