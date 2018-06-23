// $Id: $
// File name:   counter.sv
// Created:     2/15/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// clk	input	100 MHz system clock signal with a 50% duty cycle.
// n_rst	input	Asynchronous active low system reset signal. When this signal is asserted, all FF values in the design are set immediately to logic-0.
// cnt_up	input	This signal is the count enable for the counter. This signal should only be pulsed for 1 clock cycle (i.e. asserted for only 1 clock cycle and then cleared).
// clear	input	This signal is a synchronous reset, set the counter to zero.
// one_k_samples	output	Indicates that 1,000 samples have been processed since the assertion/power-on. Must be an active-high signal and stable while modwait is low. 
// 

module counter
(
	input wire clk,
	input wire n_rst,
	input wire cnt_up,
	input wire clear,
	output wire one_k_samples
);

logic [9:0] count_out;

flex_counter #(10) IX 
(
	.clk(clk), 
	.n_rst(n_rst),
	.clear(1'b0), 
	.count_enable(cnt_up), 
	.rollover_val(10'd1000), 
	.count_out(count_out), 
	.rollover_flag(one_k_samples)
); 

endmodule


