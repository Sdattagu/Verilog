// Shounak's tb_flex_counter for flex_counter.sv
// This code serves as a test bench for flexible counter design. 

`timescale 1ns / 100 ps

module tb_flex_counter
();
	//Define local parameters used by the test bench
	localparam NUM_INPUT_BITS = 4; //This is variable, 4 by default.
	//input wire clk,
	//input wire n_rst,
	//input wire clear,
	//input wire count_enable,

	//Declare Design Under Test (DUT) portmap signals
	input wire tb_clear;
	input wire tb_count_enable;
	reg [(NUM_INPUT_BITS - 1):0] tb_rollover_val;
	reg [(NUM_INPUT_BITS - 1):0] tb_count_out;
	reg tb_rollover_flag;

	//Declare test bench signals
	reg [(NUM_INPUT_BITS - 1):0] tb_test_rollover_val;
	reg [(NUM_INPUT_BITS - 1):0] tb_test_expected_outputs;

	//DUT port map
	flex_counter #(NUM_INPUT_BITS) DUT (.clear(.tb_clear), .count_enable(.tb_count_enable), .rollover_val(.tb_rollover_val), .count_out(.tb_count_out), .rollover_flag(.tb_rollover_flag));

	// Test bench process
	initial
	begin
		
	//Case 1
	
	tb_test_rollover_val = 4'b0001
	tb_test_expected_outputs = 4'b00

