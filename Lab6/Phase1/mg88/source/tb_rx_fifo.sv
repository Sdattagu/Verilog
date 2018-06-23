// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Test bench for rx_fifo
// Written by Shounak Dattagupta
// 

`timescale 1ns / 100 ps

module tb_rx_fifo();

//Define parameters
	//Local parameters.
	localparam NUM_BITS = 1;
	localparam CLOCK_PERIOD = 10.0ns;
	localparam DELAY = 2;

	//Test bench parameters.
	reg tb_clk;
	reg tb_n_rst;
	reg tb_r_enable;
	reg tb_w_enable;
	reg tb_w_data [7:0];
	reg tb_r_data [7:0];
	reg tb_empty;
	reg tb_full;
	
	//DUT port mapping
	rx_fifo DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),	
		.r_enable(tb_r_enable),
		.w_enable(tb_w_enable),
		.w_data(tb_w_data),
		.r_data(tb_r_data),
		.empty(tb_empty),
		.full(tb_full)
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

	//async reset to clear any existing logic.
	tb_n_rst = 1'b0;
	
	//initialize inputs
	tb_r_enable = 1'b0;
	tb_w_enable = 1'b0;
	//tb_r_data = 8'b10000000;
	
	#(CLOCK_PERIOD * 2);
	tb_n_rst = 1'b1;

	@(negedge tb_clk)
	tb_r_enable = 1'b1;
	#(2 * CLOCK_PERIOD);
	tb_w_enable = 1'b0;
	#(2 * CLOCK_PERIOD);
	//tb_w_data = 8'b10101010;

	@(negedge tb_clk)
	tb_r_enable = 1'b0;
	#(2 * CLOCK_PERIOD);
	tb_w_enable = 1'b1;
	#(2 * CLOCK_PERIOD);
	//tb_w_data = 8'b01010101;

end

endmodule



	
	
