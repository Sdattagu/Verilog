// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/29/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Test bench for usb_receiver
// Top-level module 
// Written by Shounak Dattagupta
// 

`timescale 1ns / 100 ps

module tb_usb_receiver();

//Define parameters.
	//local parameters.
	//localparam NUM_BITS = 2;
	localparam CLOCK_PERIOD = 10.4;
	localparam DELAY = 2;
	localparam DB_PERIOD = 8*CLOCK_PERIOD;
	localparam SLOW_DB_PERIOD = 1.04* DB_PERIOD;

	//Test bench parameters.

	reg tb_clk;
	reg tb_divclk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	reg tb_rcving;
	reg tb_r_error;

	//DUT port mappings.
	usb_receiver DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus), //input
		.d_minus(tb_d_minus), //input
		.r_enable(tb_r_enable), //input
		.r_data(tb_r_data), //output
		.empty(tb_empty), //output
		.full(tb_full), //output
		.rcving(tb_rcving), //output
		.r_error(tb_r_error) //output
	);
	
	//Clock logic for TB_CLOCK
	always
	begin
		tb_clk = 1'b0;
		# (CLOCK_PERIOD/2.0);
		tb_clk = 1'b1;
		# (CLOCK_PERIOD/2.0);
	end
	
	//CLOCK logic for 8-clock
	/*always
	begin
		tb_divclk = 1'b0;
		# (CLOCK_PERIOD/2.0);
		tb_divclk = 1'b1;
		# (CLOCK_PERIOD/2.0);
	end*/

//Begin test bench process.

initial
begin

	//Initialize tb signals to avoid metastable triggers
	//tb_d_plus = 1'b1;
	//tb_d_minus = 1'b0;
	
	//TEST CASE 1. INCORRECT SYNC.

	//async reset to clear any existing logic
	tb_n_rst = 1'b0;
	#(DELAY)

	//Initialize tb signals to avoid metastable triggers
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b0;

	tb_n_rst = 1'b1;

	//Assert d_edge to go from IDLE -> RCV_SYNC
	//3 clock cycles of IDLE.
	#(DB_PERIOD);
	tb_d_plus = 1; //IDLE
	tb_d_minus = 0;
	#(DB_PERIOD);
	tb_d_plus = 1; //IDLE
	tb_d_minus = 0;
	#(DB_PERIOD);
	tb_d_plus = 1; //IDLE
	tb_d_minus = 0;

	//Start feeding it an incorrect sync byte, d_edge will be asserted and state should move to RCV_SYNC.
	//INCORRECT SYNC BYTE CASE
	#(DB_PERIOD);
	tb_d_plus = 0; //d_orig = 0
	tb_d_minus = 1;
	#(DB_PERIOD);
	tb_d_plus = 1; //0
	tb_d_minus = 0;
	#(DB_PERIOD);
	tb_d_plus = 1;
	tb_d_minus = 0; //1, erroneous sync bit
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //0
	#(DB_PERIOD);
	tb_d_plus = 1;
	tb_d_minus = 0; //0
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //0
	#(DB_PERIOD);
	tb_d_plus = 1;
	tb_d_minus = 0; //0
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //1
	#(DB_PERIOD)

	//Since incorrect sync, RCV_SYNC -> ERROR state.

	//TEST CASE 2. CORRECT SYNC.
	
	//async reset to clear any existing logic
	tb_n_rst = 1'b0;
	#(2*DELAY)
	
	//Initialize tb signals to avoid metastable triggers
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b0;

	tb_n_rst = 1'b1;
	
	//Assert d_edge to go from IDLE -> RCV_SYNC
	//3 clock cycles of IDLE.
	#(DB_PERIOD);
	tb_d_plus = 1; //IDLE
	tb_d_minus = 0;
	#(DB_PERIOD);
	tb_d_plus = 1; //IDLE
	tb_d_minus = 0;
	#(DB_PERIOD);
	tb_d_plus = 1; //IDLE
	tb_d_minus = 0;

	//Start feeding a correct sync byte, d_edge should be asserted and state should move to RCV_SYNC.
	//CORRECT SYNC BYTE CASE
	#(DB_PERIOD);
	tb_d_plus = 0; //d_orig = 0
	tb_d_minus = 1;
	#(DB_PERIOD);
	tb_d_plus = 1; //0
	tb_d_minus = 0;
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //0
	#(DB_PERIOD);
	tb_d_plus = 1;
	tb_d_minus = 0; //0
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //0
	#(DB_PERIOD);
	tb_d_plus = 1;
	tb_d_minus = 0; //0
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //0
	#(DB_PERIOD);
	tb_d_plus = 0;
	tb_d_minus = 1; //1

	//Since correct sync, RCV_SYNC -> BEGIN_RCV state.
	
	//TEST CASE 3. SEND PACKET DATA.
	//We are in BEGIN_RCV state. Keep sending bits of data at rate "DB_PERIOD"
	//Once 8 bits are sent, byte_received will be asserted, and BEGIN_RCV -> SAVE_BYTE.
	//PACKET: 10100111
	#(DB_PERIOD)
	tb_d_plus = 1; //1
	tb_d_minus = 0;
	#(DB_PERIOD)
	tb_d_plus = 1; //2
	tb_d_minus = 0;
	#(DB_PERIOD)
	tb_d_plus = 0; //3
	tb_d_minus = 1;
	#(DB_PERIOD)
	tb_d_plus = 0; //4
	tb_d_minus = 1;
	#(DB_PERIOD)
	tb_d_plus = 1; //5
	tb_d_minus = 0;
	#(DB_PERIOD)
	tb_d_plus = 0; //6
	tb_d_plus = 1;
	#(DB_PERIOD)
	tb_d_plus = 0; //7
	tb_d_plus = 1;
	#(DB_PERIOD)
	tb_d_plus = 0; //8
	tb_d_plus = 1;
	//byte_received asserted. Goes to SAVE_BYTE.

	//SAVE_BYTE -> CHECK_EOP
	//#(DB_PERIOD)

	//assert eop (1st cycle of low data, for EOP); CHECK_EOP -> CHECK_DEDGE
	#(DB_PERIOD)
	tb_d_plus = 0;
	tb_d_minus = 0;
	//keep d_edge = 0 (2nd cycle of low data, for EOP); CHECK_DEDGE -> CHECK_DEDGE2
	#(DB_PERIOD)
	tb_d_plus = 0;
	tb_d_minus = 0;
	//assert d_edge (3rd cycle of high data, for EOP complete); CHECK_DEDGE2 -> IDLE
	#(DB_PERIOD)
	tb_d_plus = 1;
	tb_d_minus = 0;

	//Should end up in IDLE.

	//IDLE -> RCV_SYNC (2)
	#(DB_PERIOD)
	tb_d_plus = 0;
	tb_d_minus = 0;  

end

endmodule

		





















