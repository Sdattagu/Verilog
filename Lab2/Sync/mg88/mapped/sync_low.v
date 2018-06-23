/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 25 23:47:51 2016
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   middleSig;

  DFFSR middleSig_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        middleSig) );
  DFFSR sync_out_reg ( .D(middleSig), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule

