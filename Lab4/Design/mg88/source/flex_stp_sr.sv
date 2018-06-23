// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/1/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description:
//
// clk	input	System clock (400 MHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values (the common serial data bus idle value of '1').
// shift_enable	input	This is the serial input signal and thus will contain the value to be shifted into the register. The default/idle value for this signal is a logic '1', since this is the common idle value used in serial communications. 
// parallel_output[(NUM_BITS - 1):0]	input	This is the data that is currently held by the shift register. 
//

module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input reg serial_in,
	output reg [(NUM_BITS - 1):0] parallel_out
);

genvar i;
logic [(NUM_BITS - 1):0] intermediate;

always_ff @ (posedge clk, negedge n_rst)
begin: STP_LOGIC
	if(1'b0 == n_rst)
		parallel_out <= '1;
	else
	begin
		parallel_out <= intermediate;
	end
end

always_comb
begin
	intermediate = parallel_out;

	if(1'b1 == shift_enable)
	begin
		if(1'b1 == SHIFT_MSB)
		begin
			intermediate = {parallel_out[(NUM_BITS - 2):0], serial_in};
		end
		else if(1'b0 == SHIFT_MSB)
		begin
			intermediate = {serial_in, parallel_out[(NUM_BITS - 1):1]};
		end
	end
end

endmodule


		
