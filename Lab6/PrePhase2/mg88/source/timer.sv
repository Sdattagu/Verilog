// $Id: $
// File name:   timer.sv
// Created:     2/24/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// clk	input	The system clock (96 MHz), the shift_enable output will only change on the rising edge of the system clock.
// n_rst	input	This is an asynchronous, active-low system reset. When this line is low, the counter will immediately be reset and shift_enable will go to a 0.
// d_edge	input	The d_edge line is asserted for 1 clock cycle when the d_plus input changes state. This signal will be used to reset the counter to a known state. This is a synchronous reset, and is not necessarily the same reset state as the n_rst signal. 
// rcving	input	The rcving line will be asserted by the rcu when the timer is to begin counting. When this line is low, the timer should reset to the initial state and the shift_enable should be a 0.
// shift_enable	output	The shift_enable signal will be high for 1 clock cycle, after which the shift registers will shift the next bit. After a reset or when rcving is low, this line will remain a 0.
// byte_received	output	The byte_received line will be high for 1 clock cycle each time a new byte has been shifted into the shift register, during the clock cycle after the 8th shift enable.
// 

module timer
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire rcving,
	output reg shift_enable,
	output wire byte_received
);

logic [3:0] intermediate_count_out;
logic [3:0] intermediate_count_out2;

flex_counter #(4) CLOCK_DIVIDER
(
	.clk(clk),
	.n_rst(n_rst),
	.clear(d_edge | !rcving), //d_edge is synchronous reset, so is rcving (when low). Either condition can be met (OR)
	.count_enable(rcving),
	.rollover_val(4'd8),
	.count_out(intermediate_count_out)
	//.rollover_flag(byte_received)
);

flex_counter #(4) BIT_SHIFT
(
	.clk(clk),
	.n_rst(n_rst),
	.clear(!rcving),
	.count_enable(shift_enable),
	.rollover_val(4'd8),
	.count_out(intermediate_count_out2),
	.rollover_flag(byte_received)
);

/*always_ff @ (posedge clk)
begin
	if(n_rst == 0)
	begin
		shift_enable <= 0;
	end
	else
	begin
		shift_enable <= rcving&&(intermediate_count_out = 4'b0001); //shift_enable goes low when rcving does, so AND it. Also dependent on count_out (1? or 2.. test). 
	end
end*/

assign shift_enable = intermediate_count_out == 4'd4 ? 1:0;

endmodule


	
