// $Id: $
// File name:   flex_counter.sv
// Created:     2/1/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// clk	input	The system clock (400 MHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values.
// clear	input	This is the active-high signal that forces the counter synchronously clear its current count back to 0.
// count_enable	input	This is the active-high enable signal that allows the counter to increment its internal value.
// rollover_val[#:0]	input	This is the N-bit value that is checked against for determining when to rollover. The actual port declaration should use the NUM_CNT_BITS parameter value to determine the '#'.
// count_out[#:0]	output	This is the current N-bit count value stored in the counter. The actual port declaration should use the NUM_CNT_BITS parameter value to determine the '#'.
// rollover_flag	output	This is the active high rollover flag and must be asserted when the rollover value is reached and cleared with the next increment. 
// 

module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(	
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input reg [(NUM_CNT_BITS - 1):0] rollover_val,
	output reg [(NUM_CNT_BITS - 1):0] count_out,
	output reg rollover_flag
);

logic [(NUM_CNT_BITS - 1):0] next_count;
logic [(NUM_CNT_BITS - 1):0] next_rollover_flag;

always_ff @ (posedge clk, negedge n_rst)
begin: FLEX_COUNTER_LOGIC
	if(1'b0 == n_rst)
	begin
		count_out <= '0;
	end
	else
	begin
		count_out <= next_count;
	end
end

always_ff @ (posedge clk, negedge n_rst)
begin: ROLLOVER_LOGIC
	if(1'b0 == n_rst)
	begin
		rollover_flag <= '0;
	end
	else
	begin
		rollover_flag <= next_rollover_flag;
	end
end

always_comb
begin: FLEX_COUNTER_LOGIC_COMB
	next_count = count_out;

	if(clear == 1)
	begin
		next_count = 0;
	end
	if(count_enable == 1)
	begin
		next_count = next_count + 1;
	end
end

always_comb
begin: ROLLOVER_LOGIC_COMB
	next_rollover_flag = rollover_flag;

	if(count_enable == 1)
	begin
		if((count_out + 1) == rollover_val)
		begin
			next_rollover_flag = 1;
		end
		else
		begin
			next_rollover_flag = 0;
		end
		if(clear == 1)
		begin
			next_rollover_flag = 0;
		end
	end
end

endmodule


	