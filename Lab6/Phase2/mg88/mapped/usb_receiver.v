/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  1 22:18:03 2016
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   middleSig;

  DFFSR middleSig_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        middleSig) );
  DFFSR sync_out_reg ( .D(middleSig), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_out) );
endmodule


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   middleSig;

  DFFSR middleSig_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        middleSig) );
  DFFSR sync_out_reg ( .D(middleSig), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   D1, N2, D2, N3, n2, n1;

  DFFPOSX1 D1_reg ( .D(N2), .CLK(clk), .Q(D1) );
  DFFPOSX1 D2_reg ( .D(N3), .CLK(clk), .Q(D2) );
  NOR2X1 U4 ( .A(n2), .B(n1), .Y(d_edge) );
  XNOR2X1 U5 ( .A(D1), .B(D2), .Y(n2) );
  OR2X1 U6 ( .A(n1), .B(D1), .Y(N3) );
  OR2X1 U7 ( .A(d_plus), .B(n1), .Y(N2) );
  INVX2 U3 ( .A(n_rst), .Y(n1) );
endmodule


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   last_dsync, N10, n5, n6, n7, n8, n9, n1, n2, n3, n4;

  DFFPOSX1 last_dsync_reg ( .D(n9), .CLK(clk), .Q(last_dsync) );
  DFFPOSX1 d_orig_reg ( .D(N10), .CLK(clk), .Q(d_orig) );
  OAI21X1 U7 ( .A(n5), .B(n3), .C(n6), .Y(n9) );
  OAI21X1 U8 ( .A(d_plus), .B(n7), .C(n5), .Y(n6) );
  NAND2X1 U9 ( .A(n_rst), .B(n2), .Y(n5) );
  NAND2X1 U10 ( .A(n1), .B(n8), .Y(N10) );
  XOR2X1 U11 ( .A(last_dsync), .B(d_plus), .Y(n8) );
  OAI21X1 U12 ( .A(n4), .B(n2), .C(n_rst), .Y(n7) );
  INVX2 U3 ( .A(n7), .Y(n1) );
  INVX2 U4 ( .A(shift_enable), .Y(n2) );
  INVX2 U5 ( .A(last_dsync), .Y(n3) );
  INVX2 U6 ( .A(eop), .Y(n4) );
endmodule


module eop_detect ( d_plus, d_minus, eop );
  input d_plus, d_minus;
  output eop;


  NOR2X1 U1 ( .A(d_plus), .B(d_minus), .Y(eop) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N23, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         \r302/carry[3] , \r302/carry[2] , n1, n2, n3, n4, n5, n6;

  DFFSR \count_out_reg[0]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U16 ( .A(n23), .B(n24), .C(n25), .Y(n44) );
  NAND2X1 U17 ( .A(rollover_flag), .B(n26), .Y(n25) );
  NAND3X1 U18 ( .A(n27), .B(n28), .C(n29), .Y(n24) );
  XNOR2X1 U19 ( .A(N8), .B(rollover_val[1]), .Y(n29) );
  XNOR2X1 U20 ( .A(N10), .B(rollover_val[3]), .Y(n28) );
  XNOR2X1 U21 ( .A(N9), .B(rollover_val[2]), .Y(n27) );
  NAND2X1 U22 ( .A(n30), .B(n31), .Y(n23) );
  XNOR2X1 U23 ( .A(N7), .B(rollover_val[0]), .Y(n31) );
  NOR2X1 U24 ( .A(N23), .B(n6), .Y(n30) );
  AOI22X1 U25 ( .A(n26), .B(count_out[3]), .C(N10), .D(n33), .Y(n32) );
  AOI22X1 U26 ( .A(n26), .B(count_out[1]), .C(N8), .D(n33), .Y(n34) );
  AOI22X1 U27 ( .A(n26), .B(count_out[2]), .C(N9), .D(n33), .Y(n35) );
  NOR2X1 U28 ( .A(n6), .B(n4), .Y(n33) );
  OAI21X1 U29 ( .A(n5), .B(N7), .C(n37), .Y(n45) );
  OAI21X1 U30 ( .A(n4), .B(N7), .C(n36), .Y(n37) );
  NOR2X1 U31 ( .A(n26), .B(clear), .Y(n36) );
  NAND3X1 U32 ( .A(n39), .B(n40), .C(n41), .Y(n38) );
  NOR2X1 U33 ( .A(n42), .B(n43), .Y(n41) );
  XOR2X1 U34 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n43) );
  XOR2X1 U35 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n42) );
  XNOR2X1 U36 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n40) );
  XNOR2X1 U37 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n39) );
  NOR2X1 U38 ( .A(clear), .B(count_enable), .Y(n26) );
  HAX1 \r302/U1_1_1  ( .A(count_out[1]), .B(count_out[0]), .YC(\r302/carry[2] ), .YS(N8) );
  HAX1 \r302/U1_1_2  ( .A(count_out[2]), .B(\r302/carry[2] ), .YC(
        \r302/carry[3] ), .YS(N9) );
  HAX1 \r302/U1_1_3  ( .A(count_out[3]), .B(\r302/carry[3] ), .YC(N23), .YS(
        N10) );
  INVX2 U7 ( .A(count_out[0]), .Y(N7) );
  INVX2 U9 ( .A(n32), .Y(n1) );
  INVX2 U10 ( .A(n35), .Y(n2) );
  INVX2 U11 ( .A(n34), .Y(n3) );
  INVX2 U12 ( .A(n38), .Y(n4) );
  INVX2 U13 ( .A(n26), .Y(n5) );
  INVX2 U14 ( .A(n36), .Y(n6) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N23, \r302/carry[3] , \r302/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n16, n17, n18, n19, n20, n21, n22, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46;

  DFFSR \count_out_reg[0]  ( .D(n7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U16 ( .A(n46), .B(n45), .C(n44), .Y(n8) );
  NAND2X1 U17 ( .A(rollover_flag), .B(n43), .Y(n44) );
  NAND3X1 U18 ( .A(n42), .B(n41), .C(n40), .Y(n45) );
  XNOR2X1 U19 ( .A(N8), .B(rollover_val[1]), .Y(n40) );
  XNOR2X1 U20 ( .A(N10), .B(rollover_val[3]), .Y(n41) );
  XNOR2X1 U21 ( .A(N9), .B(rollover_val[2]), .Y(n42) );
  NAND2X1 U22 ( .A(n39), .B(n38), .Y(n46) );
  XNOR2X1 U23 ( .A(N7), .B(rollover_val[0]), .Y(n38) );
  NOR2X1 U24 ( .A(N23), .B(n5), .Y(n39) );
  AOI22X1 U25 ( .A(n43), .B(count_out[3]), .C(N10), .D(n36), .Y(n37) );
  AOI22X1 U26 ( .A(n43), .B(count_out[1]), .C(N8), .D(n36), .Y(n35) );
  AOI22X1 U27 ( .A(n43), .B(count_out[2]), .C(N9), .D(n36), .Y(n22) );
  NOR2X1 U28 ( .A(n5), .B(n4), .Y(n36) );
  OAI21X1 U29 ( .A(n6), .B(N7), .C(n20), .Y(n7) );
  OAI21X1 U30 ( .A(n4), .B(N7), .C(n21), .Y(n20) );
  NOR2X1 U31 ( .A(n43), .B(clear), .Y(n21) );
  NAND3X1 U32 ( .A(n18), .B(n17), .C(n16), .Y(n19) );
  NOR2X1 U33 ( .A(n10), .B(n9), .Y(n16) );
  XOR2X1 U34 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n9) );
  XOR2X1 U35 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n10) );
  XNOR2X1 U36 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n17) );
  XNOR2X1 U37 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n18) );
  NOR2X1 U38 ( .A(clear), .B(count_enable), .Y(n43) );
  HAX1 \r302/U1_1_1  ( .A(count_out[1]), .B(count_out[0]), .YC(\r302/carry[2] ), .YS(N8) );
  HAX1 \r302/U1_1_2  ( .A(count_out[2]), .B(\r302/carry[2] ), .YC(
        \r302/carry[3] ), .YS(N9) );
  HAX1 \r302/U1_1_3  ( .A(count_out[3]), .B(\r302/carry[3] ), .YC(N23), .YS(
        N10) );
  INVX2 U7 ( .A(count_out[0]), .Y(N7) );
  INVX2 U9 ( .A(n37), .Y(n1) );
  INVX2 U10 ( .A(n22), .Y(n2) );
  INVX2 U11 ( .A(n35), .Y(n3) );
  INVX2 U12 ( .A(n19), .Y(n4) );
  INVX2 U13 ( .A(n21), .Y(n5) );
  INVX2 U14 ( .A(n43), .Y(n6) );
endmodule


module timer ( clk, n_rst, d_edge, rcving, shift_enable, byte_received );
  input clk, n_rst, d_edge, rcving;
  output shift_enable, byte_received;
  wire   _0_net_, _2_net_, n4, n5, n2, n3;
  wire   [3:0] intermediate_count_out;

  NAND3X1 U6 ( .A(intermediate_count_out[1]), .B(n2), .C(n5), .Y(n4) );
  NOR2X1 U7 ( .A(intermediate_count_out[3]), .B(intermediate_count_out[2]), 
        .Y(n5) );
  OR2X1 U8 ( .A(byte_received), .B(n3), .Y(_2_net_) );
  OR2X1 U9 ( .A(d_edge), .B(n3), .Y(_0_net_) );
  flex_counter_NUM_CNT_BITS4_1 CLOCK_DIVIDER ( .clk(clk), .n_rst(n_rst), 
        .clear(_0_net_), .count_enable(rcving), .rollover_val({1'b1, 1'b0, 
        1'b0, 1'b0}), .count_out(intermediate_count_out) );
  flex_counter_NUM_CNT_BITS4_0 BIT_SHIFT ( .clk(clk), .n_rst(n_rst), .clear(
        _2_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(byte_received) );
  INVX2 U3 ( .A(n4), .Y(shift_enable) );
  INVX2 U4 ( .A(intermediate_count_out[0]), .Y(n2) );
  INVX2 U5 ( .A(rcving), .Y(n3) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n3, n10, n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[7]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n8), .B(n9), .C(n3), .Y(n12) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n9), .Y(n3) );
  OAI22X1 U4 ( .A(n9), .B(n7), .C(shift_enable), .D(n8), .Y(n14) );
  OAI22X1 U6 ( .A(n9), .B(n6), .C(shift_enable), .D(n7), .Y(n16) );
  OAI22X1 U8 ( .A(n9), .B(n5), .C(shift_enable), .D(n6), .Y(n18) );
  OAI22X1 U10 ( .A(n9), .B(n4), .C(shift_enable), .D(n5), .Y(n20) );
  OAI22X1 U12 ( .A(n9), .B(n2), .C(shift_enable), .D(n4), .Y(n22) );
  OAI22X1 U14 ( .A(n9), .B(n1), .C(shift_enable), .D(n2), .Y(n24) );
  OAI21X1 U17 ( .A(shift_enable), .B(n1), .C(n10), .Y(n26) );
  NAND2X1 U18 ( .A(serial_in), .B(shift_enable), .Y(n10) );
  INVX2 U5 ( .A(parallel_out[7]), .Y(n1) );
  INVX2 U7 ( .A(parallel_out[6]), .Y(n2) );
  INVX2 U9 ( .A(parallel_out[5]), .Y(n4) );
  INVX2 U11 ( .A(parallel_out[4]), .Y(n5) );
  INVX2 U13 ( .A(parallel_out[3]), .Y(n6) );
  INVX2 U15 ( .A(parallel_out[2]), .Y(n7) );
  INVX2 U16 ( .A(parallel_out[1]), .Y(n8) );
  INVX2 U19 ( .A(shift_enable), .Y(n9) );
endmodule


module shift_register ( clk, n_rst, shift_enable, d_orig, rcv_data );
  output [7:0] rcv_data;
  input clk, n_rst, shift_enable, d_orig;


  flex_stp_sr_NUM_BITS8_SHIFT_MSB0 SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_data) );
endmodule


module rcu ( clk, n_rst, d_edge, eop, shift_enable, rcv_data, byte_received, 
        rcving, w_enable, r_error );
  input [7:0] rcv_data;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output rcving, w_enable, r_error;
  wire   N67, N69, N75, N78, N85, N95, N96, N97, N98, N99, N101, N102, n23,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n24, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94;
  wire   [4:0] state;
  assign N78 = byte_received;

  DFFSR \state_reg[0]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[3]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3])
         );
  DFFSR current_rcving_reg ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rcving) );
  DFFSR current_w_enable_reg ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        w_enable) );
  DFFSR current_r_error_reg ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        r_error) );
  AOI22X1 U25 ( .A(r_error), .B(n8), .C(N95), .D(n84), .Y(n23) );
  AOI22X1 U26 ( .A(w_enable), .B(n8), .C(N102), .D(n84), .Y(n25) );
  OAI21X1 U27 ( .A(n84), .B(n77), .C(n26), .Y(n42) );
  NAND2X1 U28 ( .A(N97), .B(n84), .Y(n26) );
  OAI21X1 U29 ( .A(n84), .B(n74), .C(n27), .Y(n43) );
  NAND2X1 U30 ( .A(N98), .B(n84), .Y(n27) );
  OAI21X1 U31 ( .A(n84), .B(n93), .C(n28), .Y(n44) );
  NAND2X1 U32 ( .A(N99), .B(n84), .Y(n28) );
  AOI22X1 U33 ( .A(rcving), .B(n8), .C(N101), .D(n84), .Y(n29) );
  OAI21X1 U34 ( .A(n84), .B(n92), .C(n30), .Y(n45) );
  NAND2X1 U35 ( .A(N96), .B(n84), .Y(n30) );
  OAI22X1 U37 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n31) );
  NAND2X1 U38 ( .A(state[1]), .B(n88), .Y(n35) );
  NAND3X1 U39 ( .A(n74), .B(n93), .C(n92), .Y(n34) );
  NAND2X1 U40 ( .A(state[2]), .B(n90), .Y(n33) );
  NAND3X1 U41 ( .A(n77), .B(n93), .C(n92), .Y(n32) );
  NOR2X1 U42 ( .A(eop), .B(n90), .Y(N85) );
  NAND2X1 U43 ( .A(shift_enable), .B(eop), .Y(N75) );
  NAND2X1 U46 ( .A(n36), .B(N78), .Y(N67) );
  NOR2X1 U47 ( .A(n36), .B(n88), .Y(N69) );
  NOR2X1 U48 ( .A(n37), .B(n38), .Y(n36) );
  NAND3X1 U49 ( .A(rcv_data[7]), .B(n89), .C(n39), .Y(n38) );
  NOR2X1 U50 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n39) );
  NAND2X1 U51 ( .A(n40), .B(n41), .Y(n37) );
  NOR2X1 U52 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n41) );
  NOR2X1 U53 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n40) );
  AND2X2 U4 ( .A(n31), .B(N75), .Y(n8) );
  INVX2 U7 ( .A(n8), .Y(n84) );
  BUFX2 U12 ( .A(state[2]), .Y(n83) );
  NOR2X1 U13 ( .A(n92), .B(state[3]), .Y(n61) );
  OAI21X1 U14 ( .A(state[0]), .B(n93), .C(n80), .Y(n10) );
  OR2X1 U15 ( .A(n10), .B(n83), .Y(n9) );
  OAI21X1 U16 ( .A(d_edge), .B(n9), .C(n77), .Y(n16) );
  OR2X1 U17 ( .A(rcving), .B(n93), .Y(n12) );
  NOR2X1 U18 ( .A(state[0]), .B(n83), .Y(n58) );
  AOI22X1 U19 ( .A(n58), .B(n10), .C(n83), .D(n61), .Y(n11) );
  OAI22X1 U20 ( .A(n12), .B(n74), .C(n94), .D(n11), .Y(n15) );
  NOR2X1 U21 ( .A(state[0]), .B(n74), .Y(n51) );
  NOR2X1 U22 ( .A(n77), .B(n51), .Y(n13) );
  NOR2X1 U23 ( .A(n74), .B(n77), .Y(n62) );
  NOR2X1 U24 ( .A(n78), .B(state[0]), .Y(n71) );
  AOI22X1 U36 ( .A(n13), .B(n12), .C(rcving), .D(n71), .Y(n14) );
  OAI21X1 U44 ( .A(n16), .B(n15), .C(n14), .Y(N101) );
  NOR2X1 U45 ( .A(n92), .B(d_edge), .Y(n17) );
  NAND3X1 U54 ( .A(n83), .B(n77), .C(n17), .Y(n57) );
  NAND3X1 U55 ( .A(state[1]), .B(n92), .C(N78), .Y(n50) );
  NAND3X1 U56 ( .A(n93), .B(n74), .C(n82), .Y(n73) );
  NOR2X1 U57 ( .A(state[0]), .B(state[1]), .Y(n22) );
  NAND3X1 U58 ( .A(n83), .B(n93), .C(n91), .Y(n18) );
  OAI21X1 U59 ( .A(n94), .B(n83), .C(n18), .Y(n21) );
  NOR2X1 U60 ( .A(n83), .B(state[1]), .Y(n65) );
  AOI22X1 U61 ( .A(N67), .B(n65), .C(N75), .D(n62), .Y(n19) );
  NAND2X1 U62 ( .A(n19), .B(n93), .Y(n20) );
  AOI22X1 U63 ( .A(n22), .B(n21), .C(n20), .D(state[0]), .Y(n24) );
  NAND3X1 U64 ( .A(n57), .B(n73), .C(n24), .Y(N96) );
  AOI21X1 U65 ( .A(n62), .B(N75), .C(n71), .Y(n56) );
  NAND3X1 U66 ( .A(n51), .B(n93), .C(N85), .Y(n47) );
  NAND3X1 U67 ( .A(n65), .B(n61), .C(N78), .Y(n46) );
  NAND2X1 U68 ( .A(n47), .B(n46), .Y(n48) );
  AOI21X1 U69 ( .A(state[3]), .B(state[1]), .C(n48), .Y(n49) );
  NAND3X1 U70 ( .A(n50), .B(n56), .C(n49), .Y(N97) );
  NOR2X1 U71 ( .A(n83), .B(n80), .Y(n52) );
  OAI21X1 U72 ( .A(state[1]), .B(N69), .C(n52), .Y(n53) );
  OAI21X1 U73 ( .A(n79), .B(N75), .C(n53), .Y(n54) );
  AOI21X1 U74 ( .A(n83), .B(state[3]), .C(n54), .Y(n55) );
  NAND3X1 U75 ( .A(n57), .B(n56), .C(n55), .Y(N98) );
  OAI21X1 U76 ( .A(n92), .B(n94), .C(state[3]), .Y(n66) );
  NOR2X1 U77 ( .A(n93), .B(n65), .Y(n70) );
  NOR2X1 U78 ( .A(N75), .B(n78), .Y(n59) );
  NAND3X1 U79 ( .A(n88), .B(state[1]), .C(n58), .Y(n67) );
  AOI21X1 U80 ( .A(n59), .B(state[0]), .C(n81), .Y(n60) );
  NAND3X1 U81 ( .A(n66), .B(n75), .C(n60), .Y(N99) );
  AOI21X1 U82 ( .A(N69), .B(n65), .C(n62), .Y(n64) );
  OAI21X1 U83 ( .A(n70), .B(n62), .C(r_error), .Y(n63) );
  OAI21X1 U84 ( .A(n80), .B(n64), .C(n63), .Y(n69) );
  OAI22X1 U85 ( .A(state[3]), .B(n67), .C(n76), .D(n66), .Y(n68) );
  OR2X1 U86 ( .A(n69), .B(n68), .Y(N95) );
  OAI21X1 U87 ( .A(n71), .B(n70), .C(w_enable), .Y(n72) );
  NAND2X1 U88 ( .A(n73), .B(n72), .Y(N102) );
  INVX2 U89 ( .A(n83), .Y(n74) );
  INVX2 U90 ( .A(n70), .Y(n75) );
  INVX2 U91 ( .A(n65), .Y(n76) );
  INVX2 U92 ( .A(state[1]), .Y(n77) );
  INVX2 U93 ( .A(n62), .Y(n78) );
  INVX2 U94 ( .A(n51), .Y(n79) );
  INVX2 U95 ( .A(n61), .Y(n80) );
  INVX2 U96 ( .A(n67), .Y(n81) );
  INVX2 U97 ( .A(n50), .Y(n82) );
  INVX2 U98 ( .A(n25), .Y(n85) );
  INVX2 U99 ( .A(n23), .Y(n86) );
  INVX2 U100 ( .A(n29), .Y(n87) );
  INVX2 U101 ( .A(N78), .Y(n88) );
  INVX2 U102 ( .A(rcv_data[0]), .Y(n89) );
  INVX2 U103 ( .A(shift_enable), .Y(n90) );
  INVX2 U104 ( .A(N75), .Y(n91) );
  INVX2 U105 ( .A(state[0]), .Y(n92) );
  INVX2 U106 ( .A(state[3]), .Y(n93) );
  INVX2 U107 ( .A(d_edge), .Y(n94) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   N10, N11, N12, N13, N14, N15, \fiforeg[0][7] , \fiforeg[0][6] ,
         \fiforeg[0][5] , \fiforeg[0][4] , \fiforeg[0][3] , \fiforeg[0][2] ,
         \fiforeg[0][1] , \fiforeg[0][0] , \fiforeg[1][7] , \fiforeg[1][6] ,
         \fiforeg[1][5] , \fiforeg[1][4] , \fiforeg[1][3] , \fiforeg[1][2] ,
         \fiforeg[1][1] , \fiforeg[1][0] , \fiforeg[2][7] , \fiforeg[2][6] ,
         \fiforeg[2][5] , \fiforeg[2][4] , \fiforeg[2][3] , \fiforeg[2][2] ,
         \fiforeg[2][1] , \fiforeg[2][0] , \fiforeg[3][7] , \fiforeg[3][6] ,
         \fiforeg[3][5] , \fiforeg[3][4] , \fiforeg[3][3] , \fiforeg[3][2] ,
         \fiforeg[3][1] , \fiforeg[3][0] , \fiforeg[4][7] , \fiforeg[4][6] ,
         \fiforeg[4][5] , \fiforeg[4][4] , \fiforeg[4][3] , \fiforeg[4][2] ,
         \fiforeg[4][1] , \fiforeg[4][0] , \fiforeg[5][7] , \fiforeg[5][6] ,
         \fiforeg[5][5] , \fiforeg[5][4] , \fiforeg[5][3] , \fiforeg[5][2] ,
         \fiforeg[5][1] , \fiforeg[5][0] , \fiforeg[6][7] , \fiforeg[6][6] ,
         \fiforeg[6][5] , \fiforeg[6][4] , \fiforeg[6][3] , \fiforeg[6][2] ,
         \fiforeg[6][1] , \fiforeg[6][0] , \fiforeg[7][7] , \fiforeg[7][6] ,
         \fiforeg[7][5] , \fiforeg[7][4] , \fiforeg[7][3] , \fiforeg[7][2] ,
         \fiforeg[7][1] , \fiforeg[7][0] , N17, N18, N19, N20, N21, N22, N23,
         N24, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n28, n29, n30, n81, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = waddr[0];
  assign N14 = waddr[1];
  assign N15 = waddr[2];

  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n152), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n151), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n150), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n149), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n148), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n147), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n146), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n145), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n144), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n143), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n142), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n141), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n140), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n139), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n138), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n137), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n136), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n135), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n134), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n133), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n132), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n131), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n130), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n129), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n128), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n127), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n126), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n125), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n124), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n123), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n122), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n121), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n120), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n119), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n118), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n117), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n116), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n115), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n114), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n113), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n112), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n111), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n110), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n109), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n108), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n107), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n106), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n105), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n104), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n103), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n102), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n101), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n100), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n99), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n98), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n97), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n96), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n95), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n94), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n93), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n92), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n91), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n90), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n89), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  OAI21X1 U2 ( .A(n1), .B(n2), .C(n3), .Y(n89) );
  NAND2X1 U3 ( .A(\fiforeg[7][0] ), .B(n2), .Y(n3) );
  OAI21X1 U4 ( .A(n4), .B(n2), .C(n5), .Y(n90) );
  NAND2X1 U5 ( .A(\fiforeg[7][1] ), .B(n2), .Y(n5) );
  OAI21X1 U6 ( .A(n6), .B(n2), .C(n7), .Y(n91) );
  NAND2X1 U7 ( .A(\fiforeg[7][2] ), .B(n2), .Y(n7) );
  OAI21X1 U8 ( .A(n8), .B(n2), .C(n9), .Y(n92) );
  NAND2X1 U9 ( .A(\fiforeg[7][3] ), .B(n2), .Y(n9) );
  OAI21X1 U10 ( .A(n10), .B(n2), .C(n11), .Y(n93) );
  NAND2X1 U11 ( .A(\fiforeg[7][4] ), .B(n2), .Y(n11) );
  OAI21X1 U12 ( .A(n12), .B(n2), .C(n13), .Y(n94) );
  NAND2X1 U13 ( .A(\fiforeg[7][5] ), .B(n2), .Y(n13) );
  OAI21X1 U14 ( .A(n14), .B(n2), .C(n15), .Y(n95) );
  NAND2X1 U15 ( .A(\fiforeg[7][6] ), .B(n2), .Y(n15) );
  OAI21X1 U16 ( .A(n16), .B(n2), .C(n17), .Y(n96) );
  NAND2X1 U17 ( .A(\fiforeg[7][7] ), .B(n2), .Y(n17) );
  NAND2X1 U18 ( .A(N13), .B(n18), .Y(n2) );
  OAI21X1 U19 ( .A(n1), .B(n19), .C(n20), .Y(n97) );
  NAND2X1 U20 ( .A(\fiforeg[6][0] ), .B(n19), .Y(n20) );
  OAI21X1 U21 ( .A(n4), .B(n19), .C(n21), .Y(n98) );
  NAND2X1 U22 ( .A(\fiforeg[6][1] ), .B(n19), .Y(n21) );
  OAI21X1 U23 ( .A(n6), .B(n19), .C(n22), .Y(n99) );
  NAND2X1 U24 ( .A(\fiforeg[6][2] ), .B(n19), .Y(n22) );
  OAI21X1 U25 ( .A(n8), .B(n19), .C(n23), .Y(n100) );
  NAND2X1 U26 ( .A(\fiforeg[6][3] ), .B(n19), .Y(n23) );
  OAI21X1 U27 ( .A(n10), .B(n19), .C(n24), .Y(n101) );
  NAND2X1 U28 ( .A(\fiforeg[6][4] ), .B(n19), .Y(n24) );
  OAI21X1 U29 ( .A(n12), .B(n19), .C(n25), .Y(n102) );
  NAND2X1 U30 ( .A(\fiforeg[6][5] ), .B(n19), .Y(n25) );
  OAI21X1 U31 ( .A(n14), .B(n19), .C(n26), .Y(n103) );
  NAND2X1 U32 ( .A(\fiforeg[6][6] ), .B(n19), .Y(n26) );
  OAI21X1 U33 ( .A(n16), .B(n19), .C(n27), .Y(n104) );
  NAND2X1 U34 ( .A(\fiforeg[6][7] ), .B(n19), .Y(n27) );
  NAND2X1 U35 ( .A(n18), .B(n261), .Y(n19) );
  NOR2X1 U36 ( .A(n262), .B(n265), .Y(n18) );
  OAI21X1 U37 ( .A(n1), .B(n31), .C(n32), .Y(n105) );
  NAND2X1 U38 ( .A(\fiforeg[5][0] ), .B(n31), .Y(n32) );
  OAI21X1 U39 ( .A(n4), .B(n31), .C(n33), .Y(n106) );
  NAND2X1 U40 ( .A(\fiforeg[5][1] ), .B(n31), .Y(n33) );
  OAI21X1 U41 ( .A(n6), .B(n31), .C(n34), .Y(n107) );
  NAND2X1 U42 ( .A(\fiforeg[5][2] ), .B(n31), .Y(n34) );
  OAI21X1 U43 ( .A(n8), .B(n31), .C(n35), .Y(n108) );
  NAND2X1 U44 ( .A(\fiforeg[5][3] ), .B(n31), .Y(n35) );
  OAI21X1 U45 ( .A(n10), .B(n31), .C(n36), .Y(n109) );
  NAND2X1 U46 ( .A(\fiforeg[5][4] ), .B(n31), .Y(n36) );
  OAI21X1 U47 ( .A(n12), .B(n31), .C(n37), .Y(n110) );
  NAND2X1 U48 ( .A(\fiforeg[5][5] ), .B(n31), .Y(n37) );
  OAI21X1 U49 ( .A(n14), .B(n31), .C(n38), .Y(n111) );
  NAND2X1 U50 ( .A(\fiforeg[5][6] ), .B(n31), .Y(n38) );
  OAI21X1 U51 ( .A(n16), .B(n31), .C(n39), .Y(n112) );
  NAND2X1 U52 ( .A(\fiforeg[5][7] ), .B(n31), .Y(n39) );
  NAND2X1 U53 ( .A(n40), .B(N13), .Y(n31) );
  OAI21X1 U54 ( .A(n1), .B(n41), .C(n42), .Y(n113) );
  NAND2X1 U55 ( .A(\fiforeg[4][0] ), .B(n41), .Y(n42) );
  OAI21X1 U56 ( .A(n4), .B(n41), .C(n43), .Y(n114) );
  NAND2X1 U57 ( .A(\fiforeg[4][1] ), .B(n41), .Y(n43) );
  OAI21X1 U58 ( .A(n6), .B(n41), .C(n44), .Y(n115) );
  NAND2X1 U59 ( .A(\fiforeg[4][2] ), .B(n41), .Y(n44) );
  OAI21X1 U60 ( .A(n8), .B(n41), .C(n45), .Y(n116) );
  NAND2X1 U61 ( .A(\fiforeg[4][3] ), .B(n41), .Y(n45) );
  OAI21X1 U62 ( .A(n10), .B(n41), .C(n46), .Y(n117) );
  NAND2X1 U63 ( .A(\fiforeg[4][4] ), .B(n41), .Y(n46) );
  OAI21X1 U64 ( .A(n12), .B(n41), .C(n47), .Y(n118) );
  NAND2X1 U65 ( .A(\fiforeg[4][5] ), .B(n41), .Y(n47) );
  OAI21X1 U66 ( .A(n14), .B(n41), .C(n48), .Y(n119) );
  NAND2X1 U67 ( .A(\fiforeg[4][6] ), .B(n41), .Y(n48) );
  OAI21X1 U68 ( .A(n16), .B(n41), .C(n49), .Y(n120) );
  NAND2X1 U69 ( .A(\fiforeg[4][7] ), .B(n41), .Y(n49) );
  NAND2X1 U70 ( .A(n40), .B(n261), .Y(n41) );
  NOR2X1 U71 ( .A(n262), .B(N14), .Y(n40) );
  OAI21X1 U73 ( .A(n1), .B(n50), .C(n51), .Y(n121) );
  NAND2X1 U74 ( .A(\fiforeg[3][0] ), .B(n50), .Y(n51) );
  OAI21X1 U75 ( .A(n4), .B(n50), .C(n52), .Y(n122) );
  NAND2X1 U76 ( .A(\fiforeg[3][1] ), .B(n50), .Y(n52) );
  OAI21X1 U77 ( .A(n6), .B(n50), .C(n53), .Y(n123) );
  NAND2X1 U78 ( .A(\fiforeg[3][2] ), .B(n50), .Y(n53) );
  OAI21X1 U79 ( .A(n8), .B(n50), .C(n54), .Y(n124) );
  NAND2X1 U80 ( .A(\fiforeg[3][3] ), .B(n50), .Y(n54) );
  OAI21X1 U81 ( .A(n10), .B(n50), .C(n55), .Y(n125) );
  NAND2X1 U82 ( .A(\fiforeg[3][4] ), .B(n50), .Y(n55) );
  OAI21X1 U83 ( .A(n12), .B(n50), .C(n56), .Y(n126) );
  NAND2X1 U84 ( .A(\fiforeg[3][5] ), .B(n50), .Y(n56) );
  OAI21X1 U85 ( .A(n14), .B(n50), .C(n57), .Y(n127) );
  NAND2X1 U86 ( .A(\fiforeg[3][6] ), .B(n50), .Y(n57) );
  OAI21X1 U87 ( .A(n16), .B(n50), .C(n58), .Y(n128) );
  NAND2X1 U88 ( .A(\fiforeg[3][7] ), .B(n50), .Y(n58) );
  NAND2X1 U89 ( .A(n59), .B(N13), .Y(n50) );
  OAI21X1 U90 ( .A(n1), .B(n60), .C(n61), .Y(n129) );
  NAND2X1 U91 ( .A(\fiforeg[2][0] ), .B(n60), .Y(n61) );
  OAI21X1 U92 ( .A(n4), .B(n60), .C(n62), .Y(n130) );
  NAND2X1 U93 ( .A(\fiforeg[2][1] ), .B(n60), .Y(n62) );
  OAI21X1 U94 ( .A(n6), .B(n60), .C(n63), .Y(n131) );
  NAND2X1 U95 ( .A(\fiforeg[2][2] ), .B(n60), .Y(n63) );
  OAI21X1 U96 ( .A(n8), .B(n60), .C(n64), .Y(n132) );
  NAND2X1 U97 ( .A(\fiforeg[2][3] ), .B(n60), .Y(n64) );
  OAI21X1 U98 ( .A(n10), .B(n60), .C(n65), .Y(n133) );
  NAND2X1 U99 ( .A(\fiforeg[2][4] ), .B(n60), .Y(n65) );
  OAI21X1 U100 ( .A(n12), .B(n60), .C(n66), .Y(n134) );
  NAND2X1 U101 ( .A(\fiforeg[2][5] ), .B(n60), .Y(n66) );
  OAI21X1 U102 ( .A(n14), .B(n60), .C(n67), .Y(n135) );
  NAND2X1 U103 ( .A(\fiforeg[2][6] ), .B(n60), .Y(n67) );
  OAI21X1 U104 ( .A(n16), .B(n60), .C(n68), .Y(n136) );
  NAND2X1 U105 ( .A(\fiforeg[2][7] ), .B(n60), .Y(n68) );
  NAND2X1 U106 ( .A(n59), .B(n261), .Y(n60) );
  NOR2X1 U107 ( .A(n265), .B(N15), .Y(n59) );
  OAI21X1 U109 ( .A(n1), .B(n69), .C(n70), .Y(n137) );
  NAND2X1 U110 ( .A(\fiforeg[1][0] ), .B(n69), .Y(n70) );
  OAI21X1 U111 ( .A(n4), .B(n69), .C(n71), .Y(n138) );
  NAND2X1 U112 ( .A(\fiforeg[1][1] ), .B(n69), .Y(n71) );
  OAI21X1 U113 ( .A(n6), .B(n69), .C(n72), .Y(n139) );
  NAND2X1 U114 ( .A(\fiforeg[1][2] ), .B(n69), .Y(n72) );
  OAI21X1 U115 ( .A(n8), .B(n69), .C(n73), .Y(n140) );
  NAND2X1 U116 ( .A(\fiforeg[1][3] ), .B(n69), .Y(n73) );
  OAI21X1 U117 ( .A(n10), .B(n69), .C(n74), .Y(n141) );
  NAND2X1 U118 ( .A(\fiforeg[1][4] ), .B(n69), .Y(n74) );
  OAI21X1 U119 ( .A(n12), .B(n69), .C(n75), .Y(n142) );
  NAND2X1 U120 ( .A(\fiforeg[1][5] ), .B(n69), .Y(n75) );
  OAI21X1 U121 ( .A(n14), .B(n69), .C(n76), .Y(n143) );
  NAND2X1 U122 ( .A(\fiforeg[1][6] ), .B(n69), .Y(n76) );
  OAI21X1 U123 ( .A(n16), .B(n69), .C(n77), .Y(n144) );
  NAND2X1 U124 ( .A(\fiforeg[1][7] ), .B(n69), .Y(n77) );
  NAND2X1 U125 ( .A(n78), .B(N13), .Y(n69) );
  OAI21X1 U126 ( .A(n1), .B(n79), .C(n80), .Y(n145) );
  NAND2X1 U127 ( .A(\fiforeg[0][0] ), .B(n79), .Y(n80) );
  AOI22X1 U128 ( .A(N24), .B(n264), .C(wenable), .D(wdata[0]), .Y(n1) );
  OAI21X1 U129 ( .A(n4), .B(n79), .C(n82), .Y(n146) );
  NAND2X1 U130 ( .A(\fiforeg[0][1] ), .B(n79), .Y(n82) );
  AOI22X1 U131 ( .A(N23), .B(n264), .C(wdata[1]), .D(wenable), .Y(n4) );
  OAI21X1 U132 ( .A(n6), .B(n79), .C(n83), .Y(n147) );
  NAND2X1 U133 ( .A(\fiforeg[0][2] ), .B(n79), .Y(n83) );
  AOI22X1 U134 ( .A(N22), .B(n264), .C(wdata[2]), .D(wenable), .Y(n6) );
  OAI21X1 U135 ( .A(n8), .B(n79), .C(n84), .Y(n148) );
  NAND2X1 U136 ( .A(\fiforeg[0][3] ), .B(n79), .Y(n84) );
  AOI22X1 U137 ( .A(N21), .B(n264), .C(wdata[3]), .D(wenable), .Y(n8) );
  OAI21X1 U138 ( .A(n10), .B(n79), .C(n85), .Y(n149) );
  NAND2X1 U139 ( .A(\fiforeg[0][4] ), .B(n79), .Y(n85) );
  AOI22X1 U140 ( .A(N20), .B(n264), .C(wdata[4]), .D(wenable), .Y(n10) );
  OAI21X1 U141 ( .A(n12), .B(n79), .C(n86), .Y(n150) );
  NAND2X1 U142 ( .A(\fiforeg[0][5] ), .B(n79), .Y(n86) );
  AOI22X1 U143 ( .A(N19), .B(n264), .C(wdata[5]), .D(wenable), .Y(n12) );
  OAI21X1 U144 ( .A(n14), .B(n79), .C(n87), .Y(n151) );
  NAND2X1 U145 ( .A(\fiforeg[0][6] ), .B(n79), .Y(n87) );
  AOI22X1 U146 ( .A(N18), .B(n264), .C(wdata[6]), .D(wenable), .Y(n14) );
  OAI21X1 U147 ( .A(n16), .B(n79), .C(n88), .Y(n152) );
  NAND2X1 U148 ( .A(\fiforeg[0][7] ), .B(n79), .Y(n88) );
  NAND2X1 U149 ( .A(n78), .B(n261), .Y(n79) );
  NOR2X1 U151 ( .A(N15), .B(N14), .Y(n78) );
  AOI22X1 U152 ( .A(N17), .B(n264), .C(wdata[7]), .D(wenable), .Y(n16) );
  NOR2X1 U72 ( .A(n262), .B(n265), .Y(n28) );
  NOR2X1 U108 ( .A(n262), .B(N14), .Y(n29) );
  NOR2X1 U150 ( .A(n265), .B(N15), .Y(n30) );
  INVX2 U153 ( .A(n81), .Y(n210) );
  INVX2 U154 ( .A(n153), .Y(n263) );
  OR2X1 U155 ( .A(n207), .B(n206), .Y(n81) );
  INVX2 U156 ( .A(n155), .Y(n212) );
  INVX2 U157 ( .A(n154), .Y(n211) );
  INVX2 U158 ( .A(n156), .Y(n209) );
  OR2X1 U159 ( .A(N14), .B(N15), .Y(n153) );
  OR2X1 U160 ( .A(N11), .B(N12), .Y(n154) );
  OR2X1 U161 ( .A(n206), .B(N12), .Y(n155) );
  OR2X1 U162 ( .A(n207), .B(N11), .Y(n156) );
  BUFX2 U163 ( .A(N10), .Y(n208) );
  AOI22X1 U164 ( .A(\fiforeg[4][0] ), .B(n209), .C(\fiforeg[6][0] ), .D(n210), 
        .Y(n158) );
  AOI22X1 U165 ( .A(\fiforeg[0][0] ), .B(n211), .C(\fiforeg[2][0] ), .D(n212), 
        .Y(n157) );
  AOI21X1 U166 ( .A(n158), .B(n157), .C(n208), .Y(n162) );
  AOI22X1 U167 ( .A(\fiforeg[5][0] ), .B(n209), .C(\fiforeg[7][0] ), .D(n210), 
        .Y(n160) );
  AOI22X1 U168 ( .A(\fiforeg[1][0] ), .B(n211), .C(\fiforeg[3][0] ), .D(n212), 
        .Y(n159) );
  AOI21X1 U169 ( .A(n160), .B(n159), .C(n205), .Y(n161) );
  OR2X1 U170 ( .A(n162), .B(n161), .Y(rdata[0]) );
  AOI22X1 U171 ( .A(\fiforeg[4][1] ), .B(n209), .C(\fiforeg[6][1] ), .D(n210), 
        .Y(n164) );
  AOI22X1 U172 ( .A(\fiforeg[0][1] ), .B(n211), .C(\fiforeg[2][1] ), .D(n212), 
        .Y(n163) );
  AOI21X1 U173 ( .A(n164), .B(n163), .C(n208), .Y(n168) );
  AOI22X1 U174 ( .A(\fiforeg[5][1] ), .B(n209), .C(\fiforeg[7][1] ), .D(n210), 
        .Y(n166) );
  AOI22X1 U175 ( .A(\fiforeg[1][1] ), .B(n211), .C(\fiforeg[3][1] ), .D(n212), 
        .Y(n165) );
  AOI21X1 U176 ( .A(n166), .B(n165), .C(n205), .Y(n167) );
  OR2X1 U177 ( .A(n168), .B(n167), .Y(rdata[1]) );
  AOI22X1 U178 ( .A(\fiforeg[4][2] ), .B(n209), .C(\fiforeg[6][2] ), .D(n210), 
        .Y(n170) );
  AOI22X1 U179 ( .A(\fiforeg[0][2] ), .B(n211), .C(\fiforeg[2][2] ), .D(n212), 
        .Y(n169) );
  AOI21X1 U180 ( .A(n170), .B(n169), .C(n208), .Y(n174) );
  AOI22X1 U181 ( .A(\fiforeg[5][2] ), .B(n209), .C(\fiforeg[7][2] ), .D(n210), 
        .Y(n172) );
  AOI22X1 U182 ( .A(\fiforeg[1][2] ), .B(n211), .C(\fiforeg[3][2] ), .D(n212), 
        .Y(n171) );
  AOI21X1 U183 ( .A(n172), .B(n171), .C(n205), .Y(n173) );
  OR2X1 U184 ( .A(n174), .B(n173), .Y(rdata[2]) );
  AOI22X1 U185 ( .A(\fiforeg[4][3] ), .B(n209), .C(\fiforeg[6][3] ), .D(n210), 
        .Y(n176) );
  AOI22X1 U186 ( .A(\fiforeg[0][3] ), .B(n211), .C(\fiforeg[2][3] ), .D(n212), 
        .Y(n175) );
  AOI21X1 U187 ( .A(n176), .B(n175), .C(n208), .Y(n180) );
  AOI22X1 U188 ( .A(\fiforeg[5][3] ), .B(n209), .C(\fiforeg[7][3] ), .D(n210), 
        .Y(n178) );
  AOI22X1 U189 ( .A(\fiforeg[1][3] ), .B(n211), .C(\fiforeg[3][3] ), .D(n212), 
        .Y(n177) );
  AOI21X1 U190 ( .A(n178), .B(n177), .C(n205), .Y(n179) );
  OR2X1 U191 ( .A(n180), .B(n179), .Y(rdata[3]) );
  AOI22X1 U192 ( .A(\fiforeg[4][4] ), .B(n209), .C(\fiforeg[6][4] ), .D(n210), 
        .Y(n182) );
  AOI22X1 U193 ( .A(\fiforeg[0][4] ), .B(n211), .C(\fiforeg[2][4] ), .D(n212), 
        .Y(n181) );
  AOI21X1 U194 ( .A(n182), .B(n181), .C(n208), .Y(n186) );
  AOI22X1 U195 ( .A(\fiforeg[5][4] ), .B(n209), .C(\fiforeg[7][4] ), .D(n210), 
        .Y(n184) );
  AOI22X1 U196 ( .A(\fiforeg[1][4] ), .B(n211), .C(\fiforeg[3][4] ), .D(n212), 
        .Y(n183) );
  AOI21X1 U197 ( .A(n184), .B(n183), .C(n205), .Y(n185) );
  OR2X1 U198 ( .A(n186), .B(n185), .Y(rdata[4]) );
  AOI22X1 U199 ( .A(\fiforeg[4][5] ), .B(n209), .C(\fiforeg[6][5] ), .D(n210), 
        .Y(n188) );
  AOI22X1 U200 ( .A(\fiforeg[0][5] ), .B(n211), .C(\fiforeg[2][5] ), .D(n212), 
        .Y(n187) );
  AOI21X1 U201 ( .A(n188), .B(n187), .C(n208), .Y(n192) );
  AOI22X1 U202 ( .A(\fiforeg[5][5] ), .B(n209), .C(\fiforeg[7][5] ), .D(n210), 
        .Y(n190) );
  AOI22X1 U203 ( .A(\fiforeg[1][5] ), .B(n211), .C(\fiforeg[3][5] ), .D(n212), 
        .Y(n189) );
  AOI21X1 U204 ( .A(n190), .B(n189), .C(n205), .Y(n191) );
  OR2X1 U205 ( .A(n192), .B(n191), .Y(rdata[5]) );
  AOI22X1 U206 ( .A(\fiforeg[4][6] ), .B(n209), .C(\fiforeg[6][6] ), .D(n210), 
        .Y(n194) );
  AOI22X1 U207 ( .A(\fiforeg[0][6] ), .B(n211), .C(\fiforeg[2][6] ), .D(n212), 
        .Y(n193) );
  AOI21X1 U208 ( .A(n194), .B(n193), .C(n208), .Y(n198) );
  AOI22X1 U209 ( .A(\fiforeg[5][6] ), .B(n209), .C(\fiforeg[7][6] ), .D(n210), 
        .Y(n196) );
  AOI22X1 U210 ( .A(\fiforeg[1][6] ), .B(n211), .C(\fiforeg[3][6] ), .D(n212), 
        .Y(n195) );
  AOI21X1 U211 ( .A(n196), .B(n195), .C(n205), .Y(n197) );
  OR2X1 U212 ( .A(n198), .B(n197), .Y(rdata[6]) );
  AOI22X1 U213 ( .A(\fiforeg[4][7] ), .B(n209), .C(\fiforeg[6][7] ), .D(n210), 
        .Y(n200) );
  AOI22X1 U214 ( .A(\fiforeg[0][7] ), .B(n211), .C(\fiforeg[2][7] ), .D(n212), 
        .Y(n199) );
  AOI21X1 U215 ( .A(n200), .B(n199), .C(n208), .Y(n204) );
  AOI22X1 U216 ( .A(\fiforeg[5][7] ), .B(n209), .C(\fiforeg[7][7] ), .D(n210), 
        .Y(n202) );
  AOI22X1 U217 ( .A(\fiforeg[1][7] ), .B(n211), .C(\fiforeg[3][7] ), .D(n212), 
        .Y(n201) );
  AOI21X1 U218 ( .A(n202), .B(n201), .C(n205), .Y(n203) );
  OR2X1 U219 ( .A(n204), .B(n203), .Y(rdata[7]) );
  INVX2 U220 ( .A(n208), .Y(n205) );
  INVX2 U221 ( .A(N11), .Y(n206) );
  INVX2 U222 ( .A(N12), .Y(n207) );
  AOI22X1 U223 ( .A(\fiforeg[4][0] ), .B(n29), .C(\fiforeg[6][0] ), .D(n28), 
        .Y(n214) );
  AOI22X1 U224 ( .A(\fiforeg[0][0] ), .B(n263), .C(\fiforeg[2][0] ), .D(n30), 
        .Y(n213) );
  AOI21X1 U225 ( .A(n214), .B(n213), .C(N13), .Y(n218) );
  AOI22X1 U226 ( .A(\fiforeg[5][0] ), .B(n29), .C(\fiforeg[7][0] ), .D(n28), 
        .Y(n216) );
  AOI22X1 U227 ( .A(\fiforeg[1][0] ), .B(n263), .C(\fiforeg[3][0] ), .D(n30), 
        .Y(n215) );
  AOI21X1 U228 ( .A(n216), .B(n215), .C(n261), .Y(n217) );
  OR2X1 U229 ( .A(n218), .B(n217), .Y(N24) );
  AOI22X1 U230 ( .A(\fiforeg[4][1] ), .B(n29), .C(\fiforeg[6][1] ), .D(n18), 
        .Y(n220) );
  AOI22X1 U231 ( .A(\fiforeg[0][1] ), .B(n263), .C(\fiforeg[2][1] ), .D(n30), 
        .Y(n219) );
  AOI21X1 U232 ( .A(n220), .B(n219), .C(N13), .Y(n224) );
  AOI22X1 U233 ( .A(\fiforeg[5][1] ), .B(n29), .C(\fiforeg[7][1] ), .D(n28), 
        .Y(n222) );
  AOI22X1 U234 ( .A(\fiforeg[1][1] ), .B(n263), .C(\fiforeg[3][1] ), .D(n30), 
        .Y(n221) );
  AOI21X1 U235 ( .A(n222), .B(n221), .C(n261), .Y(n223) );
  OR2X1 U236 ( .A(n224), .B(n223), .Y(N23) );
  AOI22X1 U237 ( .A(\fiforeg[4][2] ), .B(n29), .C(\fiforeg[6][2] ), .D(n28), 
        .Y(n226) );
  AOI22X1 U238 ( .A(\fiforeg[0][2] ), .B(n263), .C(\fiforeg[2][2] ), .D(n30), 
        .Y(n225) );
  AOI21X1 U239 ( .A(n226), .B(n225), .C(N13), .Y(n230) );
  AOI22X1 U240 ( .A(\fiforeg[5][2] ), .B(n29), .C(\fiforeg[7][2] ), .D(n28), 
        .Y(n228) );
  AOI22X1 U241 ( .A(\fiforeg[1][2] ), .B(n263), .C(\fiforeg[3][2] ), .D(n59), 
        .Y(n227) );
  AOI21X1 U242 ( .A(n228), .B(n227), .C(n261), .Y(n229) );
  OR2X1 U243 ( .A(n230), .B(n229), .Y(N22) );
  AOI22X1 U244 ( .A(\fiforeg[4][3] ), .B(n29), .C(\fiforeg[6][3] ), .D(n28), 
        .Y(n232) );
  AOI22X1 U245 ( .A(\fiforeg[0][3] ), .B(n263), .C(\fiforeg[2][3] ), .D(n30), 
        .Y(n231) );
  AOI21X1 U246 ( .A(n232), .B(n231), .C(N13), .Y(n236) );
  AOI22X1 U247 ( .A(\fiforeg[5][3] ), .B(n40), .C(\fiforeg[7][3] ), .D(n28), 
        .Y(n234) );
  AOI22X1 U248 ( .A(\fiforeg[1][3] ), .B(n263), .C(\fiforeg[3][3] ), .D(n59), 
        .Y(n233) );
  AOI21X1 U249 ( .A(n234), .B(n233), .C(n261), .Y(n235) );
  OR2X1 U250 ( .A(n236), .B(n235), .Y(N21) );
  AOI22X1 U251 ( .A(\fiforeg[4][4] ), .B(n29), .C(\fiforeg[6][4] ), .D(n18), 
        .Y(n238) );
  AOI22X1 U252 ( .A(\fiforeg[0][4] ), .B(n263), .C(\fiforeg[2][4] ), .D(n30), 
        .Y(n237) );
  AOI21X1 U253 ( .A(n238), .B(n237), .C(N13), .Y(n242) );
  AOI22X1 U254 ( .A(\fiforeg[5][4] ), .B(n40), .C(\fiforeg[7][4] ), .D(n28), 
        .Y(n240) );
  AOI22X1 U255 ( .A(\fiforeg[1][4] ), .B(n263), .C(\fiforeg[3][4] ), .D(n59), 
        .Y(n239) );
  AOI21X1 U256 ( .A(n240), .B(n239), .C(n261), .Y(n241) );
  OR2X1 U257 ( .A(n242), .B(n241), .Y(N20) );
  AOI22X1 U258 ( .A(\fiforeg[4][5] ), .B(n29), .C(\fiforeg[6][5] ), .D(n18), 
        .Y(n244) );
  AOI22X1 U259 ( .A(\fiforeg[0][5] ), .B(n263), .C(\fiforeg[2][5] ), .D(n30), 
        .Y(n243) );
  AOI21X1 U260 ( .A(n244), .B(n243), .C(N13), .Y(n248) );
  AOI22X1 U261 ( .A(\fiforeg[5][5] ), .B(n40), .C(\fiforeg[7][5] ), .D(n28), 
        .Y(n246) );
  AOI22X1 U262 ( .A(\fiforeg[1][5] ), .B(n263), .C(\fiforeg[3][5] ), .D(n59), 
        .Y(n245) );
  AOI21X1 U263 ( .A(n246), .B(n245), .C(n261), .Y(n247) );
  OR2X1 U264 ( .A(n248), .B(n247), .Y(N19) );
  AOI22X1 U265 ( .A(\fiforeg[4][6] ), .B(n29), .C(\fiforeg[6][6] ), .D(n18), 
        .Y(n250) );
  AOI22X1 U266 ( .A(\fiforeg[0][6] ), .B(n263), .C(\fiforeg[2][6] ), .D(n30), 
        .Y(n249) );
  AOI21X1 U267 ( .A(n250), .B(n249), .C(N13), .Y(n254) );
  AOI22X1 U268 ( .A(\fiforeg[5][6] ), .B(n40), .C(\fiforeg[7][6] ), .D(n28), 
        .Y(n252) );
  AOI22X1 U269 ( .A(\fiforeg[1][6] ), .B(n263), .C(\fiforeg[3][6] ), .D(n59), 
        .Y(n251) );
  AOI21X1 U270 ( .A(n252), .B(n251), .C(n261), .Y(n253) );
  OR2X1 U271 ( .A(n254), .B(n253), .Y(N18) );
  AOI22X1 U272 ( .A(\fiforeg[4][7] ), .B(n29), .C(\fiforeg[6][7] ), .D(n18), 
        .Y(n256) );
  AOI22X1 U273 ( .A(\fiforeg[0][7] ), .B(n263), .C(\fiforeg[2][7] ), .D(n30), 
        .Y(n255) );
  AOI21X1 U274 ( .A(n256), .B(n255), .C(N13), .Y(n260) );
  AOI22X1 U275 ( .A(\fiforeg[5][7] ), .B(n40), .C(\fiforeg[7][7] ), .D(n28), 
        .Y(n258) );
  AOI22X1 U276 ( .A(\fiforeg[1][7] ), .B(n263), .C(\fiforeg[3][7] ), .D(n59), 
        .Y(n257) );
  AOI21X1 U277 ( .A(n258), .B(n257), .C(n261), .Y(n259) );
  OR2X1 U278 ( .A(n260), .B(n259), .Y(N17) );
  INVX2 U279 ( .A(N13), .Y(n261) );
  INVX2 U280 ( .A(N15), .Y(n262) );
  INVX2 U281 ( .A(wenable), .Y(n264) );
  INVX2 U282 ( .A(N14), .Y(n265) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n10, n11, n12, n9;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  XOR2X1 U12 ( .A(wptr_nxt[3]), .B(binary_nxt[2]), .Y(wptr_nxt[2]) );
  XNOR2X1 U13 ( .A(n10), .B(binary_r[3]), .Y(wptr_nxt[3]) );
  NAND2X1 U14 ( .A(binary_r[2]), .B(n11), .Y(n10) );
  XOR2X1 U15 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  XOR2X1 U16 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(wptr_nxt[0]) );
  XOR2X1 U17 ( .A(binary_r[2]), .B(n11), .Y(binary_nxt[2]) );
  NOR2X1 U18 ( .A(n9), .B(n12), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(wenable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(wenable), .Y(binary_nxt[0]) );
  INVX2 U11 ( .A(binary_r[1]), .Y(n9) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   \gray_wptr[2] , N5, n18, n19, n20, n21, n22, n23, n24, n1;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  NOR2X1 U16 ( .A(full_flag), .B(n1), .Y(wenable_fifo) );
  NOR2X1 U17 ( .A(n18), .B(n19), .Y(N5) );
  NAND2X1 U18 ( .A(n20), .B(n21), .Y(n19) );
  XOR2X1 U19 ( .A(n22), .B(\gray_wptr[2] ), .Y(n21) );
  XOR2X1 U20 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
  XNOR2X1 U21 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n22) );
  XNOR2X1 U22 ( .A(wrptr_r2[1]), .B(wptr_nxt[1]), .Y(n20) );
  NAND2X1 U23 ( .A(n23), .B(n24), .Y(n18) );
  XOR2X1 U24 ( .A(wrptr_r2[3]), .B(wptr_nxt[3]), .Y(n24) );
  XNOR2X1 U25 ( .A(wrptr_r2[0]), .B(wptr_nxt[0]), .Y(n23) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
  INVX2 U15 ( .A(wenable), .Y(n1) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n10, n11, n12, n9;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  XOR2X1 U12 ( .A(rptr_nxt[3]), .B(binary_nxt[2]), .Y(rptr_nxt[2]) );
  XNOR2X1 U13 ( .A(n10), .B(binary_r[3]), .Y(rptr_nxt[3]) );
  NAND2X1 U14 ( .A(binary_r[2]), .B(n11), .Y(n10) );
  XOR2X1 U15 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XOR2X1 U16 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(rptr_nxt[0]) );
  XOR2X1 U17 ( .A(binary_r[2]), .B(n11), .Y(binary_nxt[2]) );
  NOR2X1 U18 ( .A(n9), .B(n12), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(renable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(renable), .Y(binary_nxt[0]) );
  INVX2 U11 ( .A(binary_r[1]), .Y(n9) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n18, n19, n20, n21, n22, n23, n24, n1
;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  NOR2X1 U16 ( .A(empty_flag), .B(n1), .Y(renable_p2) );
  NOR2X1 U17 ( .A(n18), .B(n19), .Y(N3) );
  NAND2X1 U18 ( .A(n20), .B(n21), .Y(n19) );
  XOR2X1 U19 ( .A(n22), .B(\gray_rptr[2] ), .Y(n21) );
  XOR2X1 U20 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(\gray_rptr[2] ) );
  XNOR2X1 U21 ( .A(rwptr_r2[3]), .B(rwptr_r2[2]), .Y(n22) );
  XNOR2X1 U22 ( .A(rwptr_r2[1]), .B(rptr_nxt[1]), .Y(n20) );
  NAND2X1 U23 ( .A(n23), .B(n24), .Y(n18) );
  XNOR2X1 U24 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n24) );
  XNOR2X1 U25 ( .A(rwptr_r2[0]), .B(rptr_nxt[0]), .Y(n23) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  INVX2 U15 ( .A(renable), .Y(n1) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module rx_fifo ( clk, n_rst, r_enable, w_enable, w_data, r_data, empty, full
 );
  input [7:0] w_data;
  output [7:0] r_data;
  input clk, n_rst, r_enable, w_enable;
  output empty, full;


  fifo FIFO ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(r_enable), 
        .w_enable(w_enable), .w_data(w_data), .r_data(r_data), .empty(empty), 
        .full(full) );
endmodule


module usb_receiver ( clk, n_rst, d_plus, d_minus, r_enable, r_data, empty, 
        full, rcving, r_error );
  output [7:0] r_data;
  input clk, n_rst, d_plus, d_minus, r_enable;
  output empty, full, rcving, r_error;
  wire   d_plus_sync, d_minus_sync, d_edge, shift_enable, eop, d_orig,
         byte_received, w_enable;
  wire   [7:0] rcv_data;

  sync_high SYNC_HIGH ( .clk(clk), .n_rst(n_rst), .async_in(d_plus), 
        .sync_out(d_plus_sync) );
  sync_low SYNC_LOW ( .clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(
        d_minus_sync) );
  edge_detect EDGE_DETECT ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .d_edge(d_edge) );
  decode DECODE ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig) );
  eop_detect EOP_DETECT ( .d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(
        eop) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), 
        .shift_enable(shift_enable), .byte_received(byte_received) );
  shift_register S_R ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), 
        .d_orig(d_orig), .rcv_data(rcv_data) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), 
        .shift_enable(shift_enable), .rcv_data(rcv_data), .byte_received(
        byte_received), .rcving(rcving), .w_enable(w_enable), .r_error(r_error) );
  rx_fifo RX_FIFO ( .clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(
        w_enable), .w_data(rcv_data), .r_data(r_data), .empty(empty), .full(
        full) );
endmodule

