// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Test bench for eop_detect.sv
// Written by Shounak Dattagupta
// Based on tb_moore, also written by Shounak Dattagupta
// Exhaustive
// 

`timescale 1ns / 100 ps

module tb_eop_detect();

//Define parameters.
	//local parameters.
	localparam NUM_BITS = 2;
	localparam CLOCK_PERIOD = 5.0;
	localparam DELAY = 2;

	//Test bench parameters.

	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_eop;

	//DUT port mappings.
	eop_detect DUT
	(
		.d_plus(tb_d_plus),
		.d_minus(tb_d_minus),
		.eop(tb_eop)
	);
	
	//Clock logic
	/*always
	begin
		tb_clk = 1'b0;
		# (CLOCK_PERIOD/2.0);
		tb_clk = 1'b1;
		# (CLOCK_PERIOD/2.0);
	end*/

//Begin test bench process

initial
begin
	//Test case 1. (dplus, dminus) = (0,0)
	
	tb_d_plus = 1'b0;
	tb_d_minus = 1'b0;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 1)
	begin
		$info("Test case 1 passed.\n");
	end
	else
	begin
		$info("Test case 1 failed.\n");
	end

	//Test case 2. (dplus, dminus) = (0,1)
	
	tb_d_plus = 1'b0;
	tb_d_minus = 1'b1;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 0)
	begin
		$info("Test case 2 passed.\n");
	end
	else
	begin
		$info("Test case 2 failed.\n");
	end
	
	//Test case 3. (dplus, dminus) = (1,0)
	
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b0;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 0)
	begin
		$info("Test case 3 passed.\n");
	end
	else
	begin
		$info("Test case 3 failed.\n");
	end

	//Test case 4. (dplus, dminus) = (1,1)
	
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b1;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 0)
	begin
		$info("Test case 4 passed.\n");
	end
	else
	begin
		$info("Test case 4 failed.\n");
	end

//REPEAT FOR EXHAUSTIVE TESTING

	//Test case 1. (dplus, dminus) = (0,0)
	
	tb_d_plus = 1'b0;
	tb_d_minus = 1'b0;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 1)
	begin
		$info("Test case 5 (1) passed.\n");
	end
	else
	begin
		$info("Test case 5 (1) failed.\n");
	end

	//Test case 2. (dplus, dminus) = (0,1)
	
	tb_d_plus = 1'b0;
	tb_d_minus = 1'b1;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 0)
	begin
		$info("Test case 6 (2) passed.\n");
	end
	else
	begin
		$info("Test case 6 (2) failed.\n");
	end
	
	//Test case 3. (dplus, dminus) = (1,0)
	
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b0;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 0)
	begin
		$info("Test case 7 (3) passed.\n");
	end
	else
	begin
		$info("Test case 7 (3) failed.\n");
	end

	//Test case 4. (dplus, dminus) = (1,1)
	
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b1;
	
	//Delay for propagation
	#(DELAY);
	
	//Check results on posedge of clk.
	//@(posedge clk)
	if(tb_eop == 0)
	begin
		$info("Test case 8 (4) passed.\n");
	end
	else
	begin
		$info("Test case 8 (4) failed.\n");
	end

end

endmodule



