/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb  3 14:31:09 2016
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n60, n25, n30, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(n60) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U31 ( .A(n60), .B(count_out[0]), .Y(n30) );
  INVX1 U32 ( .A(count_out[0]), .Y(n51) );
  INVX2 U33 ( .A(n35), .Y(count_out[1]) );
  INVX1 U34 ( .A(n60), .Y(n35) );
  NOR2X1 U35 ( .A(clear), .B(n51), .Y(n32) );
  XOR2X1 U36 ( .A(count_enable), .B(n32), .Y(next_count[0]) );
  INVX2 U37 ( .A(clear), .Y(n33) );
  NAND3X1 U38 ( .A(count_enable), .B(count_out[0]), .C(n33), .Y(n34) );
  INVX2 U39 ( .A(n34), .Y(n37) );
  NOR2X1 U40 ( .A(clear), .B(n35), .Y(n36) );
  XOR2X1 U41 ( .A(n37), .B(n36), .Y(next_count[1]) );
  NAND2X1 U42 ( .A(n37), .B(n60), .Y(n40) );
  INVX2 U43 ( .A(n40), .Y(n39) );
  INVX2 U44 ( .A(count_out[2]), .Y(n44) );
  NOR2X1 U45 ( .A(clear), .B(n44), .Y(n38) );
  XOR2X1 U46 ( .A(n39), .B(n38), .Y(next_count[2]) );
  NOR2X1 U47 ( .A(n44), .B(n40), .Y(n42) );
  INVX2 U48 ( .A(count_out[3]), .Y(n54) );
  NOR2X1 U49 ( .A(clear), .B(n54), .Y(n41) );
  XOR2X1 U50 ( .A(n42), .B(n41), .Y(next_count[3]) );
  INVX2 U51 ( .A(rollover_flag), .Y(n59) );
  XOR2X1 U52 ( .A(n51), .B(rollover_val[1]), .Y(n43) );
  XOR2X1 U53 ( .A(n43), .B(count_out[1]), .Y(n50) );
  XOR2X1 U54 ( .A(n44), .B(rollover_val[2]), .Y(n45) );
  XOR2X1 U55 ( .A(n45), .B(n30), .Y(n49) );
  XOR2X1 U56 ( .A(n54), .B(rollover_val[3]), .Y(n47) );
  NAND2X1 U57 ( .A(count_out[2]), .B(n30), .Y(n55) );
  INVX2 U58 ( .A(n55), .Y(n46) );
  XOR2X1 U59 ( .A(n47), .B(n46), .Y(n48) );
  NAND3X1 U60 ( .A(n50), .B(n49), .C(n48), .Y(n57) );
  XOR2X1 U61 ( .A(n51), .B(rollover_val[0]), .Y(n52) );
  NOR2X1 U62 ( .A(clear), .B(n52), .Y(n53) );
  OAI21X1 U63 ( .A(n55), .B(n54), .C(n53), .Y(n56) );
  OR2X1 U64 ( .A(n57), .B(n56), .Y(n58) );
  MUX2X1 U65 ( .B(n59), .A(n58), .S(count_enable), .Y(n25) );
endmodule

