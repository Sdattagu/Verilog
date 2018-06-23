/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb  3 13:19:38 2016
/////////////////////////////////////////////////////////////


module flex_pts_sr_NUM_BITS9_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [8:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n31, n32, n33, n34, n35, n36, n37, n38, n39, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30;
  wire   [7:0] current;

  DFFSR \current_reg[0]  ( .D(n39), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[0]) );
  DFFSR \current_reg[1]  ( .D(n38), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[1]) );
  DFFSR \current_reg[2]  ( .D(n37), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[2]) );
  DFFSR \current_reg[3]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[3]) );
  DFFSR \current_reg[4]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[4]) );
  DFFSR \current_reg[5]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[5]) );
  DFFSR \current_reg[6]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[6]) );
  DFFSR \current_reg[7]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current[7]) );
  DFFSR \current_reg[8]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  NAND2X1 U12 ( .A(n10), .B(n11), .Y(n39) );
  INVX1 U13 ( .A(n12), .Y(n11) );
  MUX2X1 U14 ( .B(parallel_in[0]), .A(current[0]), .S(n13), .Y(n10) );
  OAI21X1 U15 ( .A(n14), .B(n15), .C(n16), .Y(n38) );
  AOI22X1 U16 ( .A(n12), .B(current[0]), .C(current[1]), .D(n13), .Y(n16) );
  INVX1 U17 ( .A(parallel_in[1]), .Y(n15) );
  OAI21X1 U18 ( .A(n14), .B(n17), .C(n18), .Y(n37) );
  AOI22X1 U19 ( .A(current[1]), .B(n12), .C(current[2]), .D(n13), .Y(n18) );
  INVX1 U20 ( .A(parallel_in[2]), .Y(n17) );
  OAI21X1 U21 ( .A(n14), .B(n19), .C(n20), .Y(n36) );
  AOI22X1 U22 ( .A(current[2]), .B(n12), .C(current[3]), .D(n13), .Y(n20) );
  INVX1 U23 ( .A(parallel_in[3]), .Y(n19) );
  OAI21X1 U24 ( .A(n14), .B(n21), .C(n22), .Y(n35) );
  AOI22X1 U25 ( .A(current[3]), .B(n12), .C(current[4]), .D(n13), .Y(n22) );
  INVX1 U26 ( .A(parallel_in[4]), .Y(n21) );
  OAI21X1 U27 ( .A(n14), .B(n23), .C(n24), .Y(n34) );
  AOI22X1 U28 ( .A(current[4]), .B(n12), .C(current[5]), .D(n13), .Y(n24) );
  INVX1 U29 ( .A(parallel_in[5]), .Y(n23) );
  OAI21X1 U30 ( .A(n14), .B(n25), .C(n26), .Y(n33) );
  AOI22X1 U31 ( .A(current[5]), .B(n12), .C(current[6]), .D(n13), .Y(n26) );
  INVX1 U32 ( .A(parallel_in[6]), .Y(n25) );
  OAI21X1 U33 ( .A(n14), .B(n27), .C(n28), .Y(n32) );
  AOI22X1 U34 ( .A(current[6]), .B(n12), .C(current[7]), .D(n13), .Y(n28) );
  INVX1 U35 ( .A(parallel_in[7]), .Y(n27) );
  OAI21X1 U36 ( .A(n14), .B(n29), .C(n30), .Y(n31) );
  AOI22X1 U37 ( .A(current[7]), .B(n12), .C(serial_out), .D(n13), .Y(n30) );
  NOR2X1 U38 ( .A(n13), .B(load_enable), .Y(n12) );
  NOR2X1 U39 ( .A(shift_enable), .B(load_enable), .Y(n13) );
  INVX1 U40 ( .A(parallel_in[8]), .Y(n29) );
  INVX1 U41 ( .A(load_enable), .Y(n14) );
endmodule


module flex_pts_sr_9_msb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [8:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr_NUM_BITS9_SHIFT_MSB1 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .load_enable(load_enable), .parallel_in(
        parallel_in), .serial_out(serial_out) );
endmodule

