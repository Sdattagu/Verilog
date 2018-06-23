// $Id: $
// File name:   rcu.sv
// Created:     2/9/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// clk			input 	System clock (400 MHz)
// n_rst		input	Asynchronous, active low system reset. 
// framing_error	input	This is the active-high signal that is updated by the stop-bit checker when sbc_enable is asserted.
// packet_done		input	This is flag signal that reports that all needed bits have been captured.
// start_bit_detected	input	This is active-high one (1) clock cycle pulse that reports when the falling edge between stop/idle line and a start-bit has occurred.
// sbc_clear		output	Active-high one (1) clock cycle pulse that tells stop-bit checker to clear its current framing error.
// sbc_enable		output	Active-high one (1) clock cycle pulse that tells the stop-bit checker to check the current stop-bit for correctness.
// load_buffer		output	Active-high one (1) clock cycle pulse that tells output data buffer to load the data from the received packet.
// enable_timer		output	This is the enable signal for the timer.

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire framing_error,
	input wire packet_done,
	input wire start_bit_detected,
	output reg sbc_clear,
	output reg sbc_enable,
	output reg load_buffer,
	output reg enable_timer
);

typedef enum bit [2:0] 
{
	IDLE, GOT_START_BIT, READ_DATA, GOT_STOP_BIT, CHECK_STOP, LOAD_BUFFER, DUMMY1 
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
begin: RCU_NEXT_STATE_LOGIC
	
	//Setting default
	next_state = state;
	
	//Define the behavior
	case(state)
		(IDLE):
		begin
			if(start_bit_detected)
			begin
				next_state = GOT_START_BIT;
			end
			else
			begin
				next_state = IDLE;
			end
		end
		(GOT_START_BIT):
		begin
			next_state = READ_DATA;
		end
		/*(DUMMY2):
		begin
			next_state = DUMMY3;
		end
		(DUMMY3):
		begin
			next_state = READ_DATA;
		end*/
		(READ_DATA):
		begin
			if(packet_done)
			begin
				next_state = GOT_STOP_BIT;
			end
			else
			begin
				next_state = READ_DATA;
			end
		end
		(GOT_STOP_BIT):
		begin
			next_state = CHECK_STOP;
		end
		(CHECK_STOP):
		begin
			if(framing_error)
			begin
				next_state = DUMMY1;
				//next_state = IDLE;
			end
			else
			begin
				next_state = LOAD_BUFFER;
			end
		end
		(DUMMY1):
		begin
			next_state = IDLE;
		end
		(LOAD_BUFFER):
		begin
			next_state = IDLE;
		end
		default
		begin
			next_state = IDLE;
		end
	endcase
end

always_comb
begin: RCU_OUTPUT_LOGIC
	
	//Setting default
	sbc_clear = 1'b0; 
	sbc_enable = 1'b0; 
	load_buffer = 1'b0; 
	enable_timer = 1'b0;
	
	//Define behavior
	case(state)
		(GOT_START_BIT):
		begin
			sbc_clear = 1'b1;
		end
		(READ_DATA):
		begin
			enable_timer = 1'b1;
		end
		(GOT_STOP_BIT):
		begin
			sbc_enable = 1'b1;
		end
		(LOAD_BUFFER):
		begin
			load_buffer = 1'b1;
		end
	endcase
end

endmodule
