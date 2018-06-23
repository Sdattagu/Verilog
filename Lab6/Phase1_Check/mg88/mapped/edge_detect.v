/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  1 18:41:00 2016
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   D1, N2, D2, N3, n3, n4;

  DFFPOSX1 D1_reg ( .D(N2), .CLK(clk), .Q(D1) );
  DFFPOSX1 D2_reg ( .D(N3), .CLK(clk), .Q(D2) );
  MUX2X1 U8 ( .B(n3), .A(N3), .S(D2), .Y(d_edge) );
  NAND2X1 U9 ( .A(D1), .B(n_rst), .Y(n3) );
  OR2X1 U10 ( .A(n4), .B(D1), .Y(N3) );
  OR2X1 U11 ( .A(d_plus), .B(n4), .Y(N2) );
  INVX1 U12 ( .A(n_rst), .Y(n4) );
endmodule

