`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 17:13:56
// Design Name: 
// Module Name: SRT_CLo
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


module SRT_CLo(
    input [4:0] ns,
    output reg [1:0] AR_mux, DR_mux,//控制输入AR和DR的选择器
    output reg AR_we, DR_we, RF_we, SRTReg_we, plus, minus, clr, busy, //前面4个分别是AR，DR，RF和SRTReg的写入使能，plus，minus和clr控制SRTReg的ra自增，ra_end自减，ra清零，busy表示正在排序
    output reg SRTReg_rstn, RF_ra0_mux,//SRTReg_rstn用来控制SRTReg的reset，mux用来选择RF上ra0的输入
    output reg [1:0] RF_wa_mux, RF_wd_mux,//用来选择wa和wd的输入
    output reg pe, ce//操作记录周期的计数器
    );
    always @(*) begin
        AR_mux = 2'b00;//各个输出的默认值
        DR_mux = 2'b11;
        AR_we = 0;
        DR_we = 0;
        RF_we = 0;
        SRTReg_we = 0;
        plus = 0;
        minus = 0;
        clr = 0;
        busy = 0;
        SRTReg_rstn = 1;
        RF_ra0_mux = 0;
        RF_wa_mux = 0;
        RF_wd_mux = 0;
        pe = 0;
        ce = 0;
        case (ns)
            5'd0:    begin//状态0：将AR置0
                AR_mux = 2'b00;
                AR_we = 1;
            end 
            5'd1:    begin//状态1：将AR指向地址的值读入DR，重置SRTReg
                DR_mux = 2'b10;
                DR_we = 1;
            end
            5'd2:    begin//状态2：作为其余状态的中转
                ;
            end
            5'd3:   begin//状态3：输入数据至DR的低位
                DR_mux = 2'b01;
                DR_we = 1;
            end
            5'd4:   begin//状态4：删除DR的低位
                DR_mux = 2'b00;
                DR_we = 1;
            end
            5'd5:   begin//状态5：将DR内的内容存至AR指向的位置中
                RF_we = 1;
            end
            5'd6:   begin//状态6：与状态5相同
                RF_we = 1;
            end
            5'd7:   begin//状态7：AR++
                AR_mux = 2'b01;
                AR_we = 1;
            end
            5'd8:   begin//状态8：AR--
                AR_mux = 2'b10;
                AR_we = 1;
            end
            5'd9:   begin//状态9：计数器置数，开始计数，重置SRTReg，busy标记亮起
                busy = 1;
                pe = 1;
                ce = 1;
                SRTReg_rstn = 0;
            end
            5'd10:   begin//状态10：将SRTReg内的ra清0（ra是用来遍历RF内数据的地址变量）
                clr = 1;
                busy = 1;
                ce = 1;
            end
            5'd11:  begin//状态11：将RF上ra0的输入值设置为SRTReg中的ra，从而比较RF[ra]和RF[ra+1]的大小
                busy = 1;
                ce = 1;
                RF_ra0_mux = 1;
            end
            5'd12:  begin//状态12：将RF[ra]和RF[ra+1]的值写入SRTReg
                SRTReg_we = 1;
                busy = 1;
                ce = 1;
                RF_ra0_mux = 1;
            end
            5'd13:  begin//状态13：将rf1（原来的RF[ra+1]）写入RF[ra]
                busy = 1;
                ce = 1;
                RF_wa_mux = 2'b01;//选择RF的写地址为SRTReg的ra
                RF_wd_mux = 2'b10;//选择RF的写数据为rf1
                RF_we = 1;
            end
            5'd14:  begin//状态14：将rf0（原来的RF[ra]）写入RF[ra+1]
                busy = 1;
                ce = 1;
                RF_wa_mux = 2'b10;//选择RF的写地址为SRTReg的ra+1
                RF_wd_mux = 2'b01;///选择RF的写数据为rf0
                RF_we = 1;
            end
            5'd15:  begin//状态15：ra++
                busy = 1;
                ce = 1;
                plus = 1;
            end
            5'd16:  begin//状态16：end--
                busy = 1;
                ce = 1;
                minus = 1;
            end
            default:    begin
                ;
            end
        endcase
    end
endmodule
