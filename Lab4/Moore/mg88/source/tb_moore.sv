// $Id: $
// File name:   tb_moore.sv
// Created:     2/5/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Test bench for Moore machine for '1101' check.
// Based off previous provided test bench code.

`timescale 1ns / 100ps

module tb_moore();

//Define parameters.
	//Local parameteres.
		localparam NUM_STATE_BITS = 3;
		localparam CLOCK_PERIOD = 5.0;
		localparam DELAY = 2;

	//Test bench parameters.
		reg tb_clk;
		reg tb_n_rst;
		reg tb_i;
		reg tb_o;

	//DUT port mapping.
	moore DUT (.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

	//Clock logic.
	always
	begin
		tb_clk = 1'b0;
		#(CLOCK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLOCK_PERIOD/2.0);
	end

//Begin test bench process.

initial
begin
	//Test case 1. IDLE -> STATE_1 (S1). input 1 -> output 0. 
	
	//Start with an asynchronous reset to clear any existing logic and reset to IDLE state.
	tb_n_rst = 1'b0; //toggle n_rst.
	#(DELAY) //Wait for prop delay
	tb_n_rst = 1'b1; //toggle n_rst.

	//Send in 1.
	@(posedge tb_clk)
	tb_i = 1'b1;
	
	//Check results on posedge of clk.
	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 1. IDLE -> STATE_1 (S1). input 1 -> output 0. PASS.\n");
	end
	else
	begin
		$error("Test case 1. IDLE -> !STATE_1 (S1). input 1 -> !output 0. FAIL.\n");
	end
	
	//Test case 2. STATE_1 (S1) -> STATE_2 (S11). input 1 -> output 0. 

	tb_i = 1'b1;
	
	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 2. STATE_1 (S1) -> STATE_2 (S11). input 1 -> output 0. PASS.\n");
	end
	else
	begin
		$error("Test case 2. STATE_1 (S1) -> !STATE_2 (S11). input 1 -> !output 0. FAIL.\n");
	end
	
	//Test case 3. STATE_2 (S11) -> STATE_3 (S110). input 0 -> output 0. 

	tb_i = 1'b0;
	
	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 3. STATE_2 (S11) -> STATE_3 (S110). input 0 -> output 0. PASS.\n");
	end
	else
	begin
		$error("Test case 3. STATE_2 (S11) -> !STATE_3 (S110). input 0 -> !output 0. FAIL.\n");
	end

	//Test case 4. STATE_3 (S110) -> STATE_4 (S1101). input 1 -> output 1. 

	tb_i = 1'b1;
	
	@(posedge tb_clk)
	if(tb_o == 1)
	begin
		$info("Test case 4. STATE_3 (S110) -> STATE_4 (S1101). input 1 -> output 1. PASS.\n");
	end
	else
	begin
		$error("Test case 4. STATE_3 (S110) -> STATE_4 (S1101). input 1 -> output 1. FAIL.\n");
	end

	//Test case 5. STATE_4 (S1101) -> STATE_2 (S11). input 1 -> output 0.
	
	tb_i = 1'b0;
	
	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 5. STATE_4 (S1101) -> STATE_2 (S11). input 1 -> output 0. PASS.\n");
	end
	else
	begin
		$error("Test case 5. STATE_4 (S1101) -> STATE_2 (S11). input 1 -> output 0. FAIL.\n");
	end

	//Test case 6. STATE_2 (S11) -> STATE_3 (S110). 0 -> 0.
	
	tb_i = 1'b0;
	
	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 6. STATE_2 (S11) -> STATE_3 (S110). 0 -> 0. PASS.\n");
	end
	else
	begin
		$error("Test case 6. STATE_2 (S11) -> STATE_3 (S110). 0 -> 0. FAIL.\n");
	end

	//Test case 7. STATE_3 (S110) -> STATE_4 (S1101). 1 -> 1.

	tb_i = 1'b1;
	
	@(posedge tb_clk)
	if(tb_o == 1)
	begin
		$info("Test case 7. STATE_3 (S110) -> STATE_4 (S1101). 1 -> 1. PASS.\n");
	end
	else
	begin
		$error("Test case 7. STATE_3 (S110) -> STATE_4 (S1101). 1 -> 1. FAIL.\n");
	end

	//Test case 8. STATE_4 (1101) -> IDLE. 0 -> 0.

	tb_i = 1'b0;
	
	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 8. STATE_4 (1101) -> IDLE. 0 -> 0. PASS.\n");
	end
	else
	begin
		$error("Test case 8. STATE_4 (1101) -> IDLE. 0 -> 0. ERROR.\n");
	end

	//Test case 9. Reset to IDLE, input up to 110, then input 0. Should output 0 and go to IDLE.
	
	//Start with an asynchronous reset to clear any existing logic and reset to IDLE state.
	tb_n_rst = 1'b0; //toggle n_rst.
	#(DELAY) //Wait for prop delay
	tb_n_rst = 1'b1; //toggle n_rst.

	//Input up to 110.
	tb_i = 1'b1;
	tb_i = 1'b1;
	tb_i = 1'b0;
	
	//Input 0.
	tb_i = 1'b0;

	@(posedge tb_clk)
	if(tb_o == 0)
	begin
		$info("Test case 9. Reset to IDLE, input up to 110, then input 0. Should output 0 and go to IDLE. PASS.\n");
	end
	else
	begin
		$error("Test case 9. Reset to IDLE, input up to 110, then input 0. Should output 0 and go to IDLE. FAIL.\n");
	end

	//Test case 10. Reset to IDLE, input up to 110, then input 1. Should output 1 and go to STATE_4.
	
	//Start with an asynchronous reset to clear any existing logic and reset to IDLE state.
	tb_n_rst = 1'b0; //toggle n_rst.
	#(DELAY) //Wait for prop delay
	tb_n_rst = 1'b1; //toggle n_rst.

	//Input up to 110.
	tb_i = 1'b1;
	tb_i = 1'b1;
	tb_i = 1'b0;
	
	//Input 0.
	tb_i = 1'b1;

	#(DELAY)
	//#(DELAY)

	@(posedge tb_clk)
	if(tb_o == 1)
	begin
		$info("Test case 10. Reset to IDLE, input up to 110, then input 1. Should output 1 and go to STATE_4. PASS.\n");
	end
	else
	begin
		$error("Test case 10. Reset to IDLE, input up to 110, then input 1. Should output 1 and go to STATE_4. FAIL.\n");
	end

	
end

endmodule


	
	
