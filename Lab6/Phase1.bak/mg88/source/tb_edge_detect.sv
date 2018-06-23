// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// 
// Test bench for edge_detect.sv
// Written by Shounak Dattagupta
// 

`timescale 1ns / 100 ps

module tb_edge_detect();

//Define parameters
	//Local parameters.
	localparam NUM_BITS = 1;
	localparam CLOCK_PERIOD = 5.0;
	localparam DELAY = 2;

	//Test bench parameters.
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_edge;

	//assign tb_n_rst = 1;
	//assign tb_d_edge = 0;

	//DUT port mapping
	edge_detect DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.d_edge(tb_d_edge)
	);

	//Clock logic
	always
	begin
		tb_clk = 1'b0;
		#(CLOCK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLOCK_PERIOD / 2.0);
	end

//Begin test bench process.

initial
begin
	//Test case 1. d_plus => 0, 0
	
	//async reset to clear any existing logic.

	tb_n_rst = 1'b0;
	#(DELAY)
	tb_n_rst = 1'b1;

	//Send in 0, 0, 1 on positive clock edges.
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;

	//Check if 0->0 produced correct d_edge response
	@(posedge tb_clk)
	if(tb_d_edge == 1'b0)
	begin
		$info("Test case 1 passed.\n");
	end
	else
	begin
		$error("Test case 1 failed.\n");
	end

	//Test case 2. d_plus => 0, 0, 1
	@(posedge tb_clk)
	tb_d_plus = 1'b1;

	@(posedge tb_clk)
	#(2 * CLOCK_PERIOD)
	if(tb_d_edge == 1'b1)
	begin
		$info("Test case 2 passed.\n");
	end
	else
	begin
		$error("Test case 2 failed.\n");
	end

	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;
	@(posedge tb_clk)
	tb_d_plus = 1'b1;
	@(posedge tb_clk)
	tb_d_plus = 1'b0;

end

endmodule


	
	