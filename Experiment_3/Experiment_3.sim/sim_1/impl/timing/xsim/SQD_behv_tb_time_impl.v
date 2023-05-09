// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sat Oct 22 14:41:00 2022
// Host        : LAPTOP-OTCI54J6 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/VivadoProjects/Experiment_3/Experiment_3.sim/sim_1/impl/timing/xsim/SQD_behv_tb_time_impl.v
// Design      : SQD
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module CLn_Moore
   (w_ns,
    w_out,
    \q_reg[0] ,
    \q_reg[0]_0 ,
    \q_reg[0]_1 ,
    \q_reg[0]_2 ,
    \q_reg[0]_3 ,
    x_IBUF);
  output [4:0]w_ns;
  output w_out;
  input \q_reg[0] ;
  input \q_reg[0]_0 ;
  input \q_reg[0]_1 ;
  input \q_reg[0]_2 ;
  input \q_reg[0]_3 ;
  input x_IBUF;

  wire \q_reg[0] ;
  wire \q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_2 ;
  wire \q_reg[0]_3 ;
  wire [4:0]w_ns;
  wire w_out;
  wire x_IBUF;

  LUT6 #(
    .INIT(64'h0001001400000000)) 
    \ns_inferred__3/i_ 
       (.I0(\q_reg[0] ),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[0]_1 ),
        .I3(\q_reg[0]_2 ),
        .I4(\q_reg[0]_3 ),
        .I5(x_IBUF),
        .O(w_ns[2]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \ns_inferred__3/i___0 
       (.I0(\q_reg[0] ),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[0]_1 ),
        .I3(\q_reg[0]_2 ),
        .I4(\q_reg[0]_3 ),
        .I5(x_IBUF),
        .O(w_ns[1]));
  LUT6 #(
    .INIT(64'hFFFEFEE9FFFFFFEF)) 
    \ns_inferred__3/i___1 
       (.I0(\q_reg[0] ),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[0]_1 ),
        .I3(\q_reg[0]_2 ),
        .I4(\q_reg[0]_3 ),
        .I5(x_IBUF),
        .O(w_ns[0]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \ns_inferred__3/i___2 
       (.I0(\q_reg[0] ),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[0]_1 ),
        .I3(\q_reg[0]_2 ),
        .I4(\q_reg[0]_3 ),
        .I5(x_IBUF),
        .O(w_ns[3]));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \ns_inferred__3/i___3 
       (.I0(\q_reg[0] ),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[0]_1 ),
        .I3(\q_reg[0]_2 ),
        .I4(\q_reg[0]_3 ),
        .I5(x_IBUF),
        .O(w_ns[4]));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \ns_inferred__3/i___4 
       (.I0(\q_reg[0] ),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[0]_1 ),
        .I3(\q_reg[0]_2 ),
        .I4(\q_reg[0]_3 ),
        .I5(x_IBUF),
        .O(w_out));
endmodule

module D_Flipflop
   (rstn,
    \q_reg[1]_0 ,
    \q_reg[0]_0 ,
    yl_OBUF,
    rstn_IBUF,
    clk_IBUF_BUFG,
    x_IBUF);
  output rstn;
  output \q_reg[1]_0 ;
  output \q_reg[0]_0 ;
  output yl_OBUF;
  input rstn_IBUF;
  input clk_IBUF_BUFG;
  input x_IBUF;

  wire clk_IBUF_BUFG;
  wire \q_reg[0]_0 ;
  wire \q_reg[1]_0 ;
  wire rstn;
  wire rstn_IBUF;
  wire [1:0]w_ns;
  wire x_IBUF;
  wire yl_OBUF;

  LUT3 #(
    .INIT(8'h94)) 
    \q[0]_i_1 
       (.I0(\q_reg[0]_0 ),
        .I1(\q_reg[1]_0 ),
        .I2(x_IBUF),
        .O(w_ns[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h38)) 
    \q[1]_i_1 
       (.I0(x_IBUF),
        .I1(\q_reg[0]_0 ),
        .I2(\q_reg[1]_0 ),
        .O(w_ns[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \q[1]_i_2 
       (.I0(rstn_IBUF),
        .O(rstn));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rstn),
        .D(w_ns[0]),
        .Q(\q_reg[0]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rstn),
        .D(w_ns[1]),
        .Q(\q_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    yl_OBUF_inst_i_1
       (.I0(\q_reg[1]_0 ),
        .I1(x_IBUF),
        .I2(\q_reg[0]_0 ),
        .O(yl_OBUF));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized0
   (sr_OBUF,
    w_ns,
    clk_IBUF_BUFG,
    \q_reg[4]_0 );
  output [4:0]sr_OBUF;
  input [4:0]w_ns;
  input clk_IBUF_BUFG;
  input \q_reg[4]_0 ;

  wire clk_IBUF_BUFG;
  wire \q_reg[4]_0 ;
  wire [4:0]sr_OBUF;
  wire [4:0]w_ns;

  FDPE #(
    .INIT(1'b1)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(w_ns[0]),
        .PRE(\q_reg[4]_0 ),
        .Q(sr_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[4]_0 ),
        .D(w_ns[1]),
        .Q(sr_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[4]_0 ),
        .D(w_ns[2]),
        .Q(sr_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[4]_0 ),
        .D(w_ns[3]),
        .Q(sr_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[4]_0 ),
        .D(w_ns[4]),
        .Q(sr_OBUF[4]));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1
   (rx_OBUF,
    x_IBUF,
    clk_IBUF_BUFG,
    \q_reg[0]_0 );
  output [0:0]rx_OBUF;
  input x_IBUF;
  input clk_IBUF_BUFG;
  input \q_reg[0]_0 ;

  wire clk_IBUF_BUFG;
  wire \q_reg[0]_0 ;
  wire [0:0]rx_OBUF;
  wire x_IBUF;

  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_0 ),
        .D(x_IBUF),
        .Q(rx_OBUF));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_0
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 ,
    lopt);
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;
  output lopt;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_lopt_replica_1 ;
  wire [0:0]rx_OBUF;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(\q_reg[0]_lopt_replica_1 ));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_1
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 ,
    lopt);
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;
  output lopt;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_lopt_replica_1 ;
  wire [0:0]rx_OBUF;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(\q_reg[0]_lopt_replica_1 ));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_2
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 ,
    lopt);
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;
  output lopt;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_lopt_replica_1 ;
  wire [0:0]rx_OBUF;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(\q_reg[0]_lopt_replica_1 ));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_3
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 ,
    lopt);
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;
  output lopt;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_lopt_replica_1 ;
  wire [0:0]rx_OBUF;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(\q_reg[0]_lopt_replica_1 ));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_4
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 ,
    lopt);
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;
  output lopt;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_lopt_replica_1 ;
  wire [0:0]rx_OBUF;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(\q_reg[0]_lopt_replica_1 ));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_5
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 ,
    lopt);
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;
  output lopt;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire \q_reg[0]_lopt_replica_1 ;
  wire [0:0]rx_OBUF;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(\q_reg[0]_lopt_replica_1 ));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_6
   (rx_OBUF,
    \q_reg[0]_0 ,
    clk_IBUF_BUFG,
    \q_reg[0]_1 );
  output [0:0]rx_OBUF;
  input [0:0]\q_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \q_reg[0]_1 ;

  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[0]_0 ;
  wire \q_reg[0]_1 ;
  wire [0:0]rx_OBUF;

  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_1 ),
        .D(\q_reg[0]_0 ),
        .Q(rx_OBUF));
endmodule

(* ORIG_REF_NAME = "D_Flipflop" *) 
module D_Flipflop__parameterized1_7
   (yr_OBUF,
    w_out,
    clk_IBUF_BUFG,
    \q_reg[0]_0 );
  output yr_OBUF;
  input w_out;
  input clk_IBUF_BUFG;
  input \q_reg[0]_0 ;

  wire clk_IBUF_BUFG;
  wire \q_reg[0]_0 ;
  wire w_out;
  wire yr_OBUF;

  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[0]_0 ),
        .D(w_out),
        .Q(yr_OBUF));
endmodule

module OR_Moore
   (yr_OBUF,
    w_out,
    clk_IBUF_BUFG,
    \q_reg[0] );
  output yr_OBUF;
  input w_out;
  input clk_IBUF_BUFG;
  input \q_reg[0] ;

  wire clk_IBUF_BUFG;
  wire \q_reg[0] ;
  wire w_out;
  wire yr_OBUF;

  D_Flipflop__parameterized1_7 flipflop
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[0]_0 (\q_reg[0] ),
        .w_out(w_out),
        .yr_OBUF(yr_OBUF));
endmodule

(* ECO_CHECKSUM = "2f64a00b" *) 
(* NotValidForBitStream *)
module SQD
   (x,
    clk,
    rstn,
    yl,
    yr,
    sl,
    sr,
    rx);
  input x;
  input clk;
  input rstn;
  output yl;
  output yr;
  output [1:0]sl;
  output [4:0]sr;
  output [7:0]rx;

  wire Mealy_n_0;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire rstn;
  wire rstn_IBUF;
  wire [7:0]rx;
  wire [7:0]rx_OBUF;
  wire [1:0]sl;
  wire [1:0]sl_OBUF;
  wire [4:0]sr;
  wire [4:0]sr_OBUF;
  wire x;
  wire x_IBUF;
  wire yl;
  wire yl_OBUF;
  wire yr;
  wire yr_OBUF;
  wire [6:1]NLW_shiftReg_rx_OBUF_UNCONNECTED;

initial begin
 $sdf_annotate("SQD_behv_tb_time_impl.sdf",,,,"tool_control");
end
  SQD_Mealy Mealy
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rstn(Mealy_n_0),
        .rstn_IBUF(rstn_IBUF),
        .sl_OBUF(sl_OBUF),
        .x_IBUF(x_IBUF),
        .yl_OBUF(yl_OBUF));
  SQD_Moore Moore
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[4] (Mealy_n_0),
        .sr_OBUF(sr_OBUF),
        .x_IBUF(x_IBUF),
        .yr_OBUF(yr_OBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF rstn_IBUF_inst
       (.I(rstn),
        .O(rstn_IBUF));
  OBUF \rx_OBUF[0]_inst 
       (.I(rx_OBUF[0]),
        .O(rx[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \rx_OBUF[1]_inst 
       (.I(lopt),
        .O(rx[1]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \rx_OBUF[2]_inst 
       (.I(lopt_1),
        .O(rx[2]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \rx_OBUF[3]_inst 
       (.I(lopt_2),
        .O(rx[3]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \rx_OBUF[4]_inst 
       (.I(lopt_3),
        .O(rx[4]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \rx_OBUF[5]_inst 
       (.I(lopt_4),
        .O(rx[5]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \rx_OBUF[6]_inst 
       (.I(lopt_5),
        .O(rx[6]));
  OBUF \rx_OBUF[7]_inst 
       (.I(rx_OBUF[7]),
        .O(rx[7]));
  ShiftReg shiftReg
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(lopt_2),
        .lopt_3(lopt_3),
        .lopt_4(lopt_4),
        .lopt_5(lopt_5),
        .\q_reg[0] (Mealy_n_0),
        .rx_OBUF({rx_OBUF[7],NLW_shiftReg_rx_OBUF_UNCONNECTED[6:1],rx_OBUF[0]}),
        .x_IBUF(x_IBUF));
  OBUF \sl_OBUF[0]_inst 
       (.I(sl_OBUF[0]),
        .O(sl[0]));
  OBUF \sl_OBUF[1]_inst 
       (.I(sl_OBUF[1]),
        .O(sl[1]));
  OBUF \sr_OBUF[0]_inst 
       (.I(sr_OBUF[0]),
        .O(sr[0]));
  OBUF \sr_OBUF[1]_inst 
       (.I(sr_OBUF[1]),
        .O(sr[1]));
  OBUF \sr_OBUF[2]_inst 
       (.I(sr_OBUF[2]),
        .O(sr[2]));
  OBUF \sr_OBUF[3]_inst 
       (.I(sr_OBUF[3]),
        .O(sr[3]));
  OBUF \sr_OBUF[4]_inst 
       (.I(sr_OBUF[4]),
        .O(sr[4]));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
  OBUF yl_OBUF_inst
       (.I(yl_OBUF),
        .O(yl));
  OBUF yr_OBUF_inst
       (.I(yr_OBUF),
        .O(yr));
endmodule

module SQD_Mealy
   (rstn,
    sl_OBUF,
    yl_OBUF,
    rstn_IBUF,
    clk_IBUF_BUFG,
    x_IBUF);
  output rstn;
  output [1:0]sl_OBUF;
  output yl_OBUF;
  input rstn_IBUF;
  input clk_IBUF_BUFG;
  input x_IBUF;

  wire clk_IBUF_BUFG;
  wire rstn;
  wire rstn_IBUF;
  wire [1:0]sl_OBUF;
  wire x_IBUF;
  wire yl_OBUF;

  SR_Mealy SR
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[0] (sl_OBUF[0]),
        .\q_reg[1] (sl_OBUF[1]),
        .rstn(rstn),
        .rstn_IBUF(rstn_IBUF),
        .x_IBUF(x_IBUF),
        .yl_OBUF(yl_OBUF));
endmodule

module SQD_Moore
   (yr_OBUF,
    sr_OBUF,
    clk_IBUF_BUFG,
    \q_reg[4] ,
    x_IBUF);
  output yr_OBUF;
  output [4:0]sr_OBUF;
  input clk_IBUF_BUFG;
  input \q_reg[4] ;
  input x_IBUF;

  wire clk_IBUF_BUFG;
  wire \q_reg[4] ;
  wire [4:0]sr_OBUF;
  wire [4:0]w_ns;
  wire w_out;
  wire x_IBUF;
  wire yr_OBUF;

  CLn_Moore CLn
       (.\q_reg[0] (sr_OBUF[0]),
        .\q_reg[0]_0 (sr_OBUF[1]),
        .\q_reg[0]_1 (sr_OBUF[2]),
        .\q_reg[0]_2 (sr_OBUF[3]),
        .\q_reg[0]_3 (sr_OBUF[4]),
        .w_ns(w_ns),
        .w_out(w_out),
        .x_IBUF(x_IBUF));
  OR_Moore OR
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[0] (\q_reg[4] ),
        .w_out(w_out),
        .yr_OBUF(yr_OBUF));
  SR_Moore SR
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[4] (\q_reg[4] ),
        .sr_OBUF(sr_OBUF),
        .w_ns(w_ns));
endmodule

module SR_Mealy
   (rstn,
    \q_reg[1] ,
    \q_reg[0] ,
    yl_OBUF,
    rstn_IBUF,
    clk_IBUF_BUFG,
    x_IBUF);
  output rstn;
  output \q_reg[1] ;
  output \q_reg[0] ;
  output yl_OBUF;
  input rstn_IBUF;
  input clk_IBUF_BUFG;
  input x_IBUF;

  wire clk_IBUF_BUFG;
  wire \q_reg[0] ;
  wire \q_reg[1] ;
  wire rstn;
  wire rstn_IBUF;
  wire x_IBUF;
  wire yl_OBUF;

  D_Flipflop flipflop
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[0]_0 (\q_reg[0] ),
        .\q_reg[1]_0 (\q_reg[1] ),
        .rstn(rstn),
        .rstn_IBUF(rstn_IBUF),
        .x_IBUF(x_IBUF),
        .yl_OBUF(yl_OBUF));
endmodule

module SR_Moore
   (sr_OBUF,
    w_ns,
    clk_IBUF_BUFG,
    \q_reg[4] );
  output [4:0]sr_OBUF;
  input [4:0]w_ns;
  input clk_IBUF_BUFG;
  input \q_reg[4] ;

  wire clk_IBUF_BUFG;
  wire \q_reg[4] ;
  wire [4:0]sr_OBUF;
  wire [4:0]w_ns;

  D_Flipflop__parameterized0 flipflop
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[4]_0 (\q_reg[4] ),
        .sr_OBUF(sr_OBUF),
        .w_ns(w_ns));
endmodule

module ShiftReg
   (rx_OBUF,
    x_IBUF,
    clk_IBUF_BUFG,
    \q_reg[0] ,
    lopt,
    lopt_1,
    lopt_2,
    lopt_3,
    lopt_4,
    lopt_5);
  output [7:0]rx_OBUF;
  input x_IBUF;
  input clk_IBUF_BUFG;
  input \q_reg[0] ;
  output lopt;
  output lopt_1;
  output lopt_2;
  output lopt_3;
  output lopt_4;
  output lopt_5;

  wire clk_IBUF_BUFG;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire \q_reg[0] ;
  wire [7:0]rx_OBUF;
  wire x_IBUF;

  D_Flipflop__parameterized1 F0
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[0]_0 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[0]),
        .x_IBUF(x_IBUF));
  D_Flipflop__parameterized1_0 F1
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt),
        .\q_reg[0]_0 (rx_OBUF[0]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[1]));
  D_Flipflop__parameterized1_1 F2
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt_1),
        .\q_reg[0]_0 (rx_OBUF[1]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[2]));
  D_Flipflop__parameterized1_2 F3
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt_2),
        .\q_reg[0]_0 (rx_OBUF[2]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[3]));
  D_Flipflop__parameterized1_3 F4
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt_3),
        .\q_reg[0]_0 (rx_OBUF[3]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[4]));
  D_Flipflop__parameterized1_4 F5
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt_4),
        .\q_reg[0]_0 (rx_OBUF[4]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[5]));
  D_Flipflop__parameterized1_5 F6
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt_5),
        .\q_reg[0]_0 (rx_OBUF[5]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[6]));
  D_Flipflop__parameterized1_6 F7
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\q_reg[0]_0 (rx_OBUF[6]),
        .\q_reg[0]_1 (\q_reg[0] ),
        .rx_OBUF(rx_OBUF[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
