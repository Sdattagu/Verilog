// $Id: $
// File name:   flex_counter_scaled.sv
// Created:     9/7/2013
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: 9-bit wrapper of the flexible counter design for testing

module flex_counter_scaled
(
	input wire clk,
	input wire clear,
	input wire n_rst,
	input wire count_enable,
	input wire [8:0] rollover_val,
	output wire [8:0] count_out,
	output wire rollover_flag
);
	flex_counter
	#(
		.NUM_CNT_BITS(9)
	)
	CORE
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear),
		.count_enable(count_enable),
		.rollover_val(rollover_val),
		.count_out(count_out),
		.rollover_flag(rollover_flag)
	);
	
endmodule
