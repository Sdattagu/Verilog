// $Id: $
// File name:   edge_detect.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 

//clk		input	
//n_rst		input
//d_plus	input
//d_edge	output

module edge_detect
(
	input wire clk,
	input wire n_rst,
	input reg d_plus,
	output reg d_edge
);

logic next_D1;
logic curr_D1;
logic D1;

logic next_D2;
logic curr_D2;
logic D2;

//logic XOR;

logic next_D_edge;

always_ff @ (posedge clk)
begin: OUTPUT_D1
	if(n_rst == 1'b0)
	begin
		D1 <= 1;
	end
	else
	begin
		D1 <= d_plus;
	end
end

always_ff @ (posedge clk)
begin: OUTPUT_D2
	if(n_rst == 1'b0)
	begin
		D2 <= 1;
	end
	else
	begin
		D2 <= D1;
	end
end

always_comb
begin: REG_DEDGE
	if(n_rst == 1'b0)
	begin
		next_D_edge <= 0;
	end
	else
	begin
		next_D_edge <= (D1 ^ D2);
	end
end	

assign d_edge = next_D_edge;

/*
always_ff @ (posedge clk)
begin: OUTPUT_D_EDGE
	if(n_rst == 1'b0)
	begin
		d_edge <= 0;
	end
	else
	begin
		next_D_edge <= XOR;
		d_edge <= next_D_edge;
	end
end
*/
endmodule


		