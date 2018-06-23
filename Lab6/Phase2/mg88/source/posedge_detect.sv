// $Id: $
// File name:   posedge_detect.sv
// Created:     2/29/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// clk	input	96 MHz clock.
// n_rst	input	Asynchronous, active-low reset.
// sync_in	input	Synchronous input signal.
// pos_edge	output	Positive edge signal.
// 

module posedge_detect
(
	input wire clk,
	input wire n_rst,
	input reg [3:0] sync_in,
	output reg pos_edge
);

reg [3:0] state; //more recent
reg [3:0] laststate; //less recent

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
	begin
		laststate <= 0;
		state <= 0;
	end
	else
	begin
		laststate <= state;
		state <= sync_in;
	end
end

assign pos_edge = (state && !laststate); //Last state is one clock cycle behind state. If Last state is 0, and state is 1, then there's a 1-0 transition.

endmodule
