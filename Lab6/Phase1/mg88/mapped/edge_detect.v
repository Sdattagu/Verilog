/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 23 23:00:42 2016
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   D1, N2, D2, N3, n3, n4, n5;

  DFFPOSX1 D1_reg ( .D(N2), .CLK(clk), .Q(D1) );
  DFFPOSX1 D2_reg ( .D(N3), .CLK(clk), .Q(D2) );
  MUX2X1 U8 ( .B(n3), .A(n4), .S(D2), .Y(d_edge) );
  NAND2X1 U9 ( .A(n_rst), .B(n5), .Y(n4) );
  INVX1 U10 ( .A(D1), .Y(n5) );
  INVX1 U11 ( .A(n3), .Y(N3) );
  NAND2X1 U12 ( .A(D1), .B(n_rst), .Y(n3) );
  AND2X1 U13 ( .A(d_plus), .B(n_rst), .Y(N2) );
endmodule

