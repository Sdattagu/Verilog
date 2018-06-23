// $Id: $
// File name:   moore.sv
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

module moore
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

typedef enum bit [2:0] 
{
	STATE_1, STATE_2, STATE_3, STATE_4, IDLE
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
		(IDLE):
		begin
			if(i == 0)
			next_state = IDLE;
			if(i == 1)
			next_state = STATE_1;
		end
		(STATE_1):
		begin
			if(i == 0)			
			next_state = IDLE;
			if(i == 1)
			next_state = STATE_2;
		end
		(STATE_2):
		begin
			if(i == 0)
			next_state = STATE_3;
			if(i == 1)
			next_state = STATE_2;
		end
		(STATE_3):
		begin
			if(i == 0)
			next_state = IDLE;
			else if(i == 1)
			next_state = STATE_4;
		end
		(STATE_4):
		begin
			if(i == 0)
			next_state = IDLE;
			if(i == 1)
			next_state = STATE_2;
		end
		default: //Accounts for extra 3 states, which are undefined. Escape condition. 
		begin
			next_state = IDLE;
		end

	endcase
end

//assign o = (next_state == STATE_4);

always_comb
begin: OUTPUT_LOGIC

	//Set default values
	o = 1'b0;
	
	//Define the behavior
	case(state)
		(STATE_1):
		begin
			o = 1'b0;
		end
		(STATE_2):
		begin
			o = 1'b0;
		end
		(STATE_3):
		begin
			o = 1'b0;
		end
		(STATE_4):
		begin
			o = 1'b1;
		end
	endcase
end
	
endmodule


