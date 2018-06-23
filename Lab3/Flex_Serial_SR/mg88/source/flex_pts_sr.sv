// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/1/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
//
// clk	input	The system clock (400 MHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values (the common serial data bus idle value of '1').
// shift_enable	input	This is the active-high enable signal that allows the shift register to shift out the next value for the serial_out port.
// load_enable	input	This is the active-high enable signal that allows the shift register to load the value at the parallel_in port. If both the shift_enable and the load_enable are active, the load_enable takes priority. 
// parallel_out[(NUM_BITS - 1):0]	input	This is the data that will be loaded into the shift register when the load_enable signal is active. 
// serial_out	output	This is the serial output signal and thus will contain the data that is being serially transmitted from the shift register.
//

module flex_pts_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire load_enable,
	input reg [(NUM_BITS - 1):0] parallel_in,
	output reg serial_out
);

logic [(NUM_BITS - 1):0] current;
logic [(NUM_BITS - 1):0] next;

always_ff @ (posedge clk, negedge n_rst)
begin: STP_LOGIC
	if(1'b0 == n_rst)
		current <= '1;
	else
	begin
		current <= next;
	end
end

always_comb
begin	
	next = parallel_in;
	if(!load_enable)
	begin
		next = current;
		if(shift_enable)
		begin
			if(SHIFT_MSB == 1)
			begin
				next = {current[(NUM_BITS-2):0], 1'b1};
			end
			else
			begin
				next = {1'b1, current[(NUM_BITS-1):1]};
			end
		end
	end

	if(SHIFT_MSB == 1)
	begin
		serial_out = current[(NUM_BITS - 1)];
	end
	else if(SHIFT_MSB == 0)
	begin
		serial_out = current[(0)];
	end
end

endmodule




