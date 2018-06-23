/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb  6 15:24:23 2016
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   \next_state[0] , n5, n8, n9, n10, n11;
  wire   [1:0] state;

  DFFSR \state_reg[1]  ( .D(n5), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[1])
         );
  DFFSR \state_reg[0]  ( .D(\next_state[0] ), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(state[0]) );
  NOR2X1 U11 ( .A(n8), .B(n9), .Y(o) );
  NAND2X1 U12 ( .A(i), .B(n10), .Y(n9) );
  INVX1 U13 ( .A(state[1]), .Y(n8) );
  MUX2X1 U14 ( .B(n11), .A(state[1]), .S(i), .Y(\next_state[0] ) );
  NOR2X1 U15 ( .A(state[1]), .B(n10), .Y(n11) );
  INVX1 U16 ( .A(state[0]), .Y(n10) );
  INVX1 U17 ( .A(i), .Y(n5) );
endmodule

