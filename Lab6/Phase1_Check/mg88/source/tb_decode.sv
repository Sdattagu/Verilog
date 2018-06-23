// $Id: $
// File name:   tb_decode.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// This is a test bench for decode.sv
// Written by Shounak Dattagupta
// Lab 6
// 

module tb_decode();

//Define parameters
	//Local parameters.
	localparam NUM_BITS = 1;
	localparam CLOCK_PERIOD = 10.0ns;
	localparam DELAY = 2;

	//Test bench parameters.
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;
	reg tb_d_orig;

	//DUT port mapping
	decode DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.shift_enable(tb_shift_enable),
		.eop(tb_eop),
		.d_orig(tb_d_orig)
	);

	//Clock logic.
	always
	begin
		tb_clk = 1'b0;
		#(CLOCK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLOCK_PERIOD / 2.0);
	end

//Begin test bench process

initial 
begin

	//Initialize shift_enable and eop
	tb_shift_enable = 1'b0;
	tb_eop = 1'b0;
	tb_d_plus = 1'b0;

	//async reset to clear any existing logic.
	tb_n_rst = 1'b0;
	#(CLOCK_PERIOD)
	tb_n_rst = 1'b1;


	/*//TEST CASE 1
		tb_n_rst = 0;
		@(negedge tb_clk)
		tb_n_rst = 1;
		tb_shift_enable = 1;
		tb_eop = 0;	
		tb_d_plus = 0;
		@(negedge tb_clk)
		@(negedge tb_clk)
		tb_shift_enable = 0;
		tb_d_plus = 1;
		@(negedge tb_clk)
		@(posedge tb_clk)
		tb_shift_enable = 1;
		@(negedge tb_clk)
		@(negedge tb_clk)
		tb_shift_enable = 0;
		#10;
		//TEST CASE 2
		tb_eop = 0;
		tb_d_plus = 0;
		@(negedge tb_clk)
		@(negedge tb_clk)
		tb_shift_enable = 1;
		tb_d_plus = 1;
		@(negedge tb_clk)
		//TEST CASE 3
		tb_eop = 1;
		@(negedge tb_clk)
		#10;*/
	
	#(CLOCK_PERIOD * 2);
	//tb_n_rst = 1'b1;

	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	#(2 * CLOCK_PERIOD);

	@(posedge tb_clk)
	//tb_d_plus = 1'b1;
	tb_shift_enable = 1'b1;
	//tb_eop = 1'b1;
	#(CLOCK_PERIOD);
	tb_shift_enable = 1'b0;

	#(7 * CLOCK_PERIOD);

	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	tb_shift_enable = 1'b1;
	#(CLOCK_PERIOD);
	tb_shift_enable = 1'b0;
	//tb_eop = 1'b0;
	#(2 * CLOCK_PERIOD);

	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	//tb_shift_enable = 1'b0;
	//tb_eop = 1'b1;
	#(2 * CLOCK_PERIOD);

	@(posedge tb_clk)
	//tb_d_plus = 1'b1;
	tb_shift_enable = 1'b1;
	#(CLOCK_PERIOD);
	tb_shift_enable = 1'b0;
	//tb_eop = 1'b0;
	//#(2 * CLOCK_PERIOD);

	/*@(negedge tb_clk)
	tb_d_plus = 1'b0;
	tb_shift_enable = 1'b0;
	tb_eop = 1'b0;
	#(2 * CLOCK_PERIOD);*/
	
	
end


endmodule




	

