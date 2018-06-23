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

	reg clk = 0;
	reg n_rst = 0;

	//Declare Design Under Test (DUT) portmap signals
	reg tb_clear = 0;
	reg tb_count_enable = 0;
	reg [(NUM_INPUT_BITS - 1):0] tb_rollover_val = '0;
	reg [(NUM_INPUT_BITS - 1):0] tb_count_out = '0;
	reg tb_rollover_flag = 0;

	//Declare test bench signals
	//reg [(NUM_INPUT_BITS - 1):0] tb_test_rollover_val;
	reg [(NUM_INPUT_BITS - 1):0] tb_test_expected_outputs = '0;

	//Clock logic
	always
	begin
		#10 clk = 1; //clk cycle up-time 10 ns
		#10 clk = 0; //clk cycle down-time 10 ns
	end
	
	//DUT port map
	flex_counter IX (.clk(clk), .n_rst(n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

	// Test bench process
initial
	begin
		
	//Case 1
	@(posedge clk)
	tb_count_enable = 0;
	n_rst = 0;
	tb_clear = 0;	
	tb_rollover_val [(NUM_INPUT_BITS - 1):0] = 4'b0101;
	tb_test_expected_outputs = 4'b0001;

	if(tb_count_out == tb_test_expected_outputs)
	begin
		$info ("Test Case 1 has passed.\n");
	end
	else
	begin
		$error("Test Case 1 has failed.\n");
	end
	#10 //time pass 10 ns
	n_rst = 0; //Throw n_rst to reset all.

	//Case 2
	@(posedge clk)
	tb_count_enable = 1;
	n_rst = 0;
	tb_clear = 0;	
	tb_rollover_val [(NUM_INPUT_BITS - 1):0] = 4'b1010;
	tb_test_expected_outputs = 4'b1001;

	if(tb_count_out == tb_test_expected_outputs)
	begin
		$info ("Test Case 1 has passed.\n");
	end
	else
	begin
		$error("Test Case 1 has failed.\n");
	end
	#10 //time pass 10 ns
	n_rst = 0; //Throw n_rst to reset all.


	//Case 3
	@(posedge clk)
	tb_count_enable = 1;
	n_rst = 1;
	tb_clear = 0;	
	tb_rollover_val [(NUM_INPUT_BITS - 1):0] = 4'b1011;
	tb_test_expected_outputs = 4'b1101;

	if(tb_count_out == tb_test_expected_outputs)
	begin
		$info ("Test Case 1 has passed.\n");
	end
	else
	begin
		$error("Test Case 1 has failed.\n");
	end
	#10 //time pass 10 ns
	n_rst = 0; //Throw n_rst to reset all.
	
	end
endmodule

	