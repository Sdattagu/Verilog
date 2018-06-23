// $Id: $
// File name:   sync_high.sv
// Created:     1/26/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Modified FF synchronizer. 
// 
// Module must have only the following ports (case-sensitive port names):
// 
// clk	input	The system clock. (1 GHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to an initial value of logic '1'.
// async_in	input	This is the asynchronous input port (the original signal is not synchronized to the supplied clock signal).
// sync_out	output	This is the synchronous output port (the form of the input that is now synchronized with the supplied clock signal). 

module sync_high
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
); 

//Code flow mirrors that of sync_low, except middle signal should be for high reset logic rather than low.

reg middleSig = 1'b1;

always_ff @ (posedge clk, negedge n_rst)
begin 
	if(1'b0 == n_rst)
	begin
		middleSig = 1'b1;
		sync_out <= 1'b1;
	end
	else
	begin
		middleSig = async_in;
		sync_out <= middleSig;
	end
end

endmodule
