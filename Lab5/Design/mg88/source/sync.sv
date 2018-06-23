// $Id: $
// File name:   sync.sv
// Created:     2/15/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// This is a copy of sync_low.sv
// It is used to synchronize the top-level inputs, data_ready and load_coeff.
// 

module sync
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
); 

reg middleSig = 1'b0; //Output of the first FF, input to second FF. Initially 0.

always_ff @ (posedge clk, negedge n_rst)
begin: SYNC 
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
