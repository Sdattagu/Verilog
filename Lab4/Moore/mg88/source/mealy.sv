// $Id: $
// File name:   mealy.sv
// Created:     2/5/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Moore machine for '1101' check.
// 
// input	wire	clk
// input	wire	n_rst
// input	wire	i
// output	reg	o
// 

module mealy
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

typedef enum bit [1:0] 
{
	STATE_1, STATE_2, STATE_3, IDLE
}
stateType;

stateType state;
stateType next_state;

always_ff @ (negedge n_rst, posedge clk)
begin: REGISTER_LOGIC
	if(1'b0 == n_rst)
	begin
		state <= IDLE;
	end
	else
	begin
		state <= next_state;
	end
end

always_comb
begin: NEXT_STATE_LOGIC

	//Setting default state
	next_state = IDLE;

	//Define the behavior
	case(state)
		(STATE_1):
		begin
			if(i == 0)
			begin
				next_state = IDLE;
			end
			else if(i == 1)
			begin
				next_state = STATE_2;
			end
		end
		(STATE_2):
		begin
			if(i == 0)
			begin
				next_state = STATE_3;
			end
			else if(i == 1)
			begin
				next_state = STATE_2;
			end
		end
		(STATE_3):
		begin
			if(i == 0 || i == 1)
			begin
				next_state = IDLE;
			end
		end

	endcase
end

always_comb
begin: OUTPUT_LOGIC

	//Setting default values
	o = 1'b0;

	//Define the behavior
	case(state)
		(STATE_1):
		begin
			if(i == 0)
			o = 1'b0;
			if(i == 1)
			o = 1'b0;
		end
		(STATE_2):
		begin
			if(i == 0)
			o = 1'b0;
			if(i == 1)
			o = 1'b0;
		end
		(STATE_3):
		begin
			if(i == 0)
			o = 1'b0;
			if(i == 1)
			o = 1'b1;
		end
		(IDLE):
		begin
			if(i == 0)
			o = 1'b0;
			if(i == 1)
			o = 1'b0;
		end
	endcase
end

endmodule


