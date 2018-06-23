// $Id: $
// File name:   sync_low.sv
// Created:     1/26/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Synchronizer module you diagrammed in Lab 1's Postlab with the following specifications:
// 
// Module must have only the following ports (case-sensitive port names):
// 
// clk		input	The system clock. (1 GHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to an initial value of logic '0'.
// async_in	input	This is the asynchronous input port (the original signal which is not synchronized to the supplied clock signal).
// sync_out	output	This is the synchronous output port (the form of the input that is now synchronize with the supplied clock s.
// 

module sync_low
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
); 

reg middleSig = 1'b0; //Output of the first FF, input to second FF. Initially 0.

always_ff @ (posedge clk, negedge n_rst)
begin 
	if(1'b0 == n_rst)
	begin
		middleSig <= 1'b0;
		sync_out <= 1'b0;
	end
	else
	begin
		middleSig <= async_in;
		sync_out <= middleSig;
	end
end

endmodule
