// $Id: $
// File name:   eop_detect.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Block detects the USB END-OF-PACKET signal. This occurs when both the d_plus and d_minus lines are set to a logic low. 
// Test bench should exhaustively test this module.
// 
// d_plus	input	The positive USB input line.
// d_minus	input	The negative USB input line.
// eop	output	EOP will be asserted asynchronously when both d_plus and d_minus are low.
// 

module eop_detect
(
	input wire d_plus,
	input wire d_minus,
	output reg eop
);

logic intermediate_eop;

always_comb
begin
	intermediate_eop = ((~d_plus) & (~d_minus));
end

assign eop = intermediate_eop;

endmodule


	
