// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Sat Feb 24 23:47:36 2018
// Host        : ispc2016 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim /home/tansei/is/cpu/cpu_experiment_core/src/ip/fcmp/fcmp_sim_netlist.v
// Design      : fcmp
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fcmp,floating_point_v7_1_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "floating_point_v7_1_3,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module fcmp
   (s_axis_a_tvalid,
    s_axis_a_tdata,
    s_axis_b_tvalid,
    s_axis_b_tdata,
    s_axis_operation_tvalid,
    s_axis_operation_tdata,
    m_axis_result_tvalid,
    m_axis_result_tdata);
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *) input s_axis_a_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *) input [31:0]s_axis_a_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_B TVALID" *) input s_axis_b_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_B TDATA" *) input [31:0]s_axis_b_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_OPERATION TVALID" *) input s_axis_operation_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_OPERATION TDATA" *) input [7:0]s_axis_operation_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *) output m_axis_result_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *) output [7:0]m_axis_result_tdata;

  wire \<const0> ;
  wire [0:0]\^m_axis_result_tdata ;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tvalid;
  wire [31:0]s_axis_b_tdata;
  wire s_axis_b_tvalid;
  wire [7:0]s_axis_operation_tdata;
  wire s_axis_operation_tvalid;
  wire NLW_U0_m_axis_result_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_a_tready_UNCONNECTED;
  wire NLW_U0_s_axis_b_tready_UNCONNECTED;
  wire NLW_U0_s_axis_c_tready_UNCONNECTED;
  wire NLW_U0_s_axis_operation_tready_UNCONNECTED;
  wire [7:1]NLW_U0_m_axis_result_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tdata[7] = \<const0> ;
  assign m_axis_result_tdata[6] = \<const0> ;
  assign m_axis_result_tdata[5] = \<const0> ;
  assign m_axis_result_tdata[4] = \<const0> ;
  assign m_axis_result_tdata[3] = \<const0> ;
  assign m_axis_result_tdata[2] = \<const0> ;
  assign m_axis_result_tdata[1] = \<const0> ;
  assign m_axis_result_tdata[0] = \^m_axis_result_tdata [0];
  GND GND
       (.G(\<const0> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "1" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "0" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "1" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "0" *) 
  (* C_RESULT_TDATA_WIDTH = "8" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "1" *) 
  (* C_THROTTLE_SCHEME = "3" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fcmp_floating_point_v7_1_3 U0
       (.aclk(1'b0),
        .aclken(1'b1),
        .aresetn(1'b1),
        .m_axis_result_tdata({NLW_U0_m_axis_result_tdata_UNCONNECTED[7:1],\^m_axis_result_tdata }),
        .m_axis_result_tlast(NLW_U0_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(1'b0),
        .m_axis_result_tuser(NLW_U0_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(NLW_U0_s_axis_a_tready_UNCONNECTED),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_U0_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_U0_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,s_axis_operation_tdata[5:3],1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_U0_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(s_axis_operation_tvalid));
endmodule

(* C_ACCUM_INPUT_MSB = "32" *) (* C_ACCUM_LSB = "-31" *) (* C_ACCUM_MSB = "32" *) 
(* C_A_FRACTION_WIDTH = "24" *) (* C_A_TDATA_WIDTH = "32" *) (* C_A_TUSER_WIDTH = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BRAM_USAGE = "0" *) (* C_B_FRACTION_WIDTH = "24" *) 
(* C_B_TDATA_WIDTH = "32" *) (* C_B_TUSER_WIDTH = "1" *) (* C_B_WIDTH = "32" *) 
(* C_COMPARE_OPERATION = "8" *) (* C_C_FRACTION_WIDTH = "24" *) (* C_C_TDATA_WIDTH = "32" *) 
(* C_C_TUSER_WIDTH = "1" *) (* C_C_WIDTH = "32" *) (* C_FIXED_DATA_UNSIGNED = "0" *) 
(* C_HAS_ABSOLUTE = "0" *) (* C_HAS_ACCUMULATOR_A = "0" *) (* C_HAS_ACCUMULATOR_S = "0" *) 
(* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) (* C_HAS_ACCUM_OVERFLOW = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ADD = "0" *) (* C_HAS_ARESETN = "0" *) (* C_HAS_A_TLAST = "0" *) 
(* C_HAS_A_TUSER = "0" *) (* C_HAS_B = "1" *) (* C_HAS_B_TLAST = "0" *) 
(* C_HAS_B_TUSER = "0" *) (* C_HAS_C = "0" *) (* C_HAS_COMPARE = "1" *) 
(* C_HAS_C_TLAST = "0" *) (* C_HAS_C_TUSER = "0" *) (* C_HAS_DIVIDE = "0" *) 
(* C_HAS_DIVIDE_BY_ZERO = "0" *) (* C_HAS_EXPONENTIAL = "0" *) (* C_HAS_FIX_TO_FLT = "0" *) 
(* C_HAS_FLT_TO_FIX = "0" *) (* C_HAS_FLT_TO_FLT = "0" *) (* C_HAS_FMA = "0" *) 
(* C_HAS_FMS = "0" *) (* C_HAS_INVALID_OP = "0" *) (* C_HAS_LOGARITHM = "0" *) 
(* C_HAS_MULTIPLY = "0" *) (* C_HAS_OPERATION = "1" *) (* C_HAS_OPERATION_TLAST = "0" *) 
(* C_HAS_OPERATION_TUSER = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_RECIP = "0" *) 
(* C_HAS_RECIP_SQRT = "0" *) (* C_HAS_RESULT_TLAST = "0" *) (* C_HAS_RESULT_TUSER = "0" *) 
(* C_HAS_SQRT = "0" *) (* C_HAS_SUBTRACT = "0" *) (* C_HAS_UNDERFLOW = "0" *) 
(* C_LATENCY = "0" *) (* C_MULT_USAGE = "0" *) (* C_OPERATION_TDATA_WIDTH = "8" *) 
(* C_OPERATION_TUSER_WIDTH = "1" *) (* C_OPTIMIZATION = "1" *) (* C_RATE = "1" *) 
(* C_RESULT_FRACTION_WIDTH = "0" *) (* C_RESULT_TDATA_WIDTH = "8" *) (* C_RESULT_TUSER_WIDTH = "1" *) 
(* C_RESULT_WIDTH = "1" *) (* C_THROTTLE_SCHEME = "3" *) (* C_TLAST_RESOLUTION = "0" *) 
(* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "floating_point_v7_1_3" *) (* downgradeipidentifiedwarnings = "yes" *) 
module fcmp_floating_point_v7_1_3
   (aclk,
    aclken,
    aresetn,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    s_axis_a_tuser,
    s_axis_a_tlast,
    s_axis_b_tvalid,
    s_axis_b_tready,
    s_axis_b_tdata,
    s_axis_b_tuser,
    s_axis_b_tlast,
    s_axis_c_tvalid,
    s_axis_c_tready,
    s_axis_c_tdata,
    s_axis_c_tuser,
    s_axis_c_tlast,
    s_axis_operation_tvalid,
    s_axis_operation_tready,
    s_axis_operation_tdata,
    s_axis_operation_tuser,
    s_axis_operation_tlast,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata,
    m_axis_result_tuser,
    m_axis_result_tlast);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_a_tvalid;
  output s_axis_a_tready;
  input [31:0]s_axis_a_tdata;
  input [0:0]s_axis_a_tuser;
  input s_axis_a_tlast;
  input s_axis_b_tvalid;
  output s_axis_b_tready;
  input [31:0]s_axis_b_tdata;
  input [0:0]s_axis_b_tuser;
  input s_axis_b_tlast;
  input s_axis_c_tvalid;
  output s_axis_c_tready;
  input [31:0]s_axis_c_tdata;
  input [0:0]s_axis_c_tuser;
  input s_axis_c_tlast;
  input s_axis_operation_tvalid;
  output s_axis_operation_tready;
  input [7:0]s_axis_operation_tdata;
  input [0:0]s_axis_operation_tuser;
  input s_axis_operation_tlast;
  output m_axis_result_tvalid;
  input m_axis_result_tready;
  output [7:0]m_axis_result_tdata;
  output [0:0]m_axis_result_tuser;
  output m_axis_result_tlast;

  wire \<const0> ;
  wire [0:0]\^m_axis_result_tdata ;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tvalid;
  wire [31:0]s_axis_b_tdata;
  wire s_axis_b_tvalid;
  wire [7:0]s_axis_operation_tdata;
  wire s_axis_operation_tvalid;
  wire NLW_i_synth_m_axis_result_tlast_UNCONNECTED;
  wire NLW_i_synth_s_axis_a_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_b_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_c_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_operation_tready_UNCONNECTED;
  wire [7:1]NLW_i_synth_m_axis_result_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tdata[7] = \<const0> ;
  assign m_axis_result_tdata[6] = \<const0> ;
  assign m_axis_result_tdata[5] = \<const0> ;
  assign m_axis_result_tdata[4] = \<const0> ;
  assign m_axis_result_tdata[3] = \<const0> ;
  assign m_axis_result_tdata[2] = \<const0> ;
  assign m_axis_result_tdata[1] = \<const0> ;
  assign m_axis_result_tdata[0] = \^m_axis_result_tdata [0];
  assign m_axis_result_tlast = \<const0> ;
  assign m_axis_result_tuser[0] = \<const0> ;
  assign s_axis_a_tready = \<const0> ;
  assign s_axis_b_tready = \<const0> ;
  assign s_axis_c_tready = \<const0> ;
  assign s_axis_operation_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "1" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "0" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "1" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "0" *) 
  (* C_RESULT_TDATA_WIDTH = "8" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "1" *) 
  (* C_THROTTLE_SCHEME = "3" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fcmp_floating_point_v7_1_3_viv i_synth
       (.aclk(1'b0),
        .aclken(1'b0),
        .aresetn(1'b0),
        .m_axis_result_tdata({NLW_i_synth_m_axis_result_tdata_UNCONNECTED[7:1],\^m_axis_result_tdata }),
        .m_axis_result_tlast(NLW_i_synth_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(1'b0),
        .m_axis_result_tuser(NLW_i_synth_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(NLW_i_synth_s_axis_a_tready_UNCONNECTED),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_i_synth_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_i_synth_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,s_axis_operation_tdata[5:3],1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_i_synth_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(s_axis_operation_tvalid));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
l1qRmlgltd31yseMMW8tZTaMitmPZO8JGC/jDitMlSX3ziLS2JeU2X2CJDqLhVprASSCVPr+Jyxx
dGXFND3ggA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
f/ih5Fjp63TK9xO3qcXxsbF2oifmU+u4Mh7RHvgmML3O3MN6fSZvb4A2w0Hvh4domr48J2N6COYv
wZhbZmsN6+cFjkTzFtY2ejCj39RFj2TrWYdxJipTe6/cUZgkJ0xMV3P9JRUKwpP8uUDHj1mTjo+b
YnsKRhOzYTo+mnUtBkM=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jh1lJf74BmlkNVanRzot6IZlynlv8I0fGeOSWHPWyw3WZnjeOGOFiWJwvKSamrlcY2vZrevJ6unU
T0wH5hBpJX/WXI2hqtNn2vg7zJCPmhM2VhW4ifIZtiOhbhE4H1xq5eGv4U69zirOw4It1VF6qhLi
ifbjwvfHqVhgk2nbxKo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ktdGJAApzEGv8QOnmBw8utImEVCJZFBx6hNym2wWi3gwzXx4eOGJSz3TUzw5wvNnOmFNKruX60Is
pNd76n7EmQpOMKDCkwl77qTztbXRodY62rQ9xUZd1+iRVa4G71DNA59RIPJlo1ZhVMcdlartHGKX
V6vd0pF8ASZ/Xyucmr4XykagosDmNVOpglVwSDYDDgUT995cFEKQ0c22VVxhEJCMICNcrJuzw1Wl
TSrcXLWLrKfpbqiLxmgkGU6P8/Z54lUj8Ga4pMjy88+G7TJQPndz7lgCB9KAMomDXTDr7dXQLQGC
tW2zs5c3AnOrTS+h5uL8EtzBHsbbpG3paAtY3Q==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TW2Z/2ck/GAFp378TGlt92pMQWGDkemYRX3fl1Q+tcp1TpFDAx5h8AIaJncKHEeMelO9TUHo+qBu
Q8wm2y2orq25GAC85ukZ+sDV3XhSFJ4MwCn0XSrSmMbR8i7kL1Gq6Bo7KOD2X63mReixDbEbbRlk
pzqL0t2nA98R2fJa2O6I6JSfWYeYpPL7JDq+6m1DPdYPyvHiQxz1hwNb3rwwe09XP84f9i1X+2Ri
W9mj3zJ/B4MJEplut9KHuPgFqS9tE6FP9tO1GEtksoRmWCrQ1i2PDYLDQE9a/UebHcW52gmFjRjH
Dlo2vT5zn3235etTO+0ML2dhVL24wzGNOwwFLA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
r2aCmCxYB/U9tZc3YIrswi+OYqkbdagYUaoNPnUlinuGwNKPesxhY2We5t0VPxaiFVl+s76lSnM0
O/64fwHNktg8QisCx24/SpmfXvnIgnrRcshvwFXK4NQbueQ2k57+rluWuRHywk3jLvv5H3ZWRO6B
sV0MfpbH/lvL1V4iBiGTGNLCXFSGe2YVtF7XHpQmFUJeD5syPOlH06pOIEUaAAMx6jYIfox0i+gs
sQKOsXoUrRJJv9TO065r9ufYnJJ69QRqyOEoJ7H/VxlxsBljQJLztaUSQkAC0Hgw80gF80Q/b4wp
L4TTorCC9C9H6dju3+hUfsSedaoEhOlNwue3Rg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
CZ9A2i4L+CAmKoGBar2IXIn+osser+gidYm3MShNteTID0tszRP8uRMVBRvl6Jp0z39o5zBWsAM9
aueILQkybD1kFsvU3yPIiiAsujK+QPNs9w9syWtV2ICrCWyjx98vOJH7ODwwtFYglx2nLdJXubMz
g6c258i/xRRwmZMumBRh+ydgHz3iqnTa+kA+o8ZZUa1qgTkqrtvsEHXm5i5y4RP6USN5py0xJeAQ
TqRpEbnJmres651c8A6C6921TVPUK4HGZgosxTvxfRVHtW6VS97Bcb8H373HgmVhOI2oDcvYOZEA
Lp3EH+wLdK9vjD3RsgNht8wOtf56cfhfYH1BTw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
Ibp3VZ/Pu7NwYkZdN1QKyFC33HH20LCP4B1CKQZXbFSpjCwls4dm3SH3uRYSiPvC5BqPJh6ZCTXi
7biOP4uHXkDCBw7tQ8jcQhN5yElLwhfGu/hnpQeTW9JOTe1IrB8mrWxc4IuNVvN5ZBMnIR1fkjoI
vEN6Q81bGDusXTXmLhyvPCytBuqFLNtdpG1mU1o0m7899AVOOI5SIB+5i0dRAvhK88PwUmMScBqh
MapisftMPWeKometTCr4toU22tIThkw4rwb2+g+kJ/Ea+wzP4vhzFQG0d2xZ+Y7AaT8PR71ZGFVx
S8U0YkWcRWkWOcQytJ6T3xhxuRzTTefJzah9Bw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 43872)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule
`endif
