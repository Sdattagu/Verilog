/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb  6 14:38:39 2016
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n4, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  NOR2X1 U20 ( .A(n15), .B(n16), .Y(o) );
  NAND2X1 U21 ( .A(state[0]), .B(n17), .Y(n16) );
  OAI21X1 U22 ( .A(n4), .B(n15), .C(n18), .Y(next_state[2]) );
  MUX2X1 U23 ( .B(state[2]), .A(n19), .S(n20), .Y(n18) );
  MUX2X1 U24 ( .B(n21), .A(n22), .S(n15), .Y(next_state[1]) );
  INVX1 U25 ( .A(state[1]), .Y(n15) );
  NAND3X1 U26 ( .A(n19), .B(n17), .C(state[0]), .Y(n22) );
  INVX1 U27 ( .A(state[2]), .Y(n17) );
  NAND2X1 U28 ( .A(n4), .B(n20), .Y(n21) );
  INVX1 U29 ( .A(state[0]), .Y(n20) );
  NOR2X1 U30 ( .A(n19), .B(state[2]), .Y(n4) );
  INVX1 U31 ( .A(i), .Y(n19) );
endmodule

