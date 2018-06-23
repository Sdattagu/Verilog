/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 23 23:01:20 2016
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   last_dsync, N10, n9, n10, n11, n12, n13;

  DFFPOSX1 last_dsync_reg ( .D(n9), .CLK(clk), .Q(last_dsync) );
  DFFPOSX1 d_orig_reg ( .D(N10), .CLK(clk), .Q(d_orig) );
  NAND2X1 U13 ( .A(n10), .B(n11), .Y(n9) );
  MUX2X1 U14 ( .B(last_dsync), .A(d_plus), .S(shift_enable), .Y(n10) );
  NAND2X1 U15 ( .A(n11), .B(n12), .Y(N10) );
  XOR2X1 U16 ( .A(last_dsync), .B(d_plus), .Y(n12) );
  AOI21X1 U17 ( .A(eop), .B(shift_enable), .C(n13), .Y(n11) );
  INVX1 U18 ( .A(n_rst), .Y(n13) );
endmodule

