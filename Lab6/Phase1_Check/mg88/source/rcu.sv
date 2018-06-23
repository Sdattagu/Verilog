// $Id: $
// File name:   rcu.sv
// Created:     2/24/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// 1) On reset, rcu goes to the IDLE state.
// 2) When an edge is detected (d_edge == 1), begin receiving data through DECODE block to the shift_reg, set the rcving line high.
// 3) After first byte is shifted in, check to see that the byte matches the USB SYNC byte (8'b10000000)
// 4) If the byte does match the SYNC byte, do not store the byte into the FIFO, but begin receiving and storing data from the next byte.
// 5) If the byte does NOT match the SYNC byte, set the r_error flag to a 1 and disregard any input until the next EOP is reached.
// 	Receiving line should remain high until the EOP is reached.
// 	Keep the r_error flag high until the next packet begins.
// 6) Continue receiving until the eop input signals that both d_plus and d_minus are low DURING A SHIFT ENABLE STROBE.
// 	Once 3-bit EOP is received, set rcving line low.
// 
// 7) If an EOP is reached with an incomplete byte in the shift register, set the r_error flag high and do not store the last byte. 
// 	Leave the r_error flag high until the next packet begins.
// 
// 
// clk	input	This is the system clock (96 MHz), all state transitions will occur on the rising edge of the clk
// n_rst 	input	This is an asynchronous, active-low system reset, which causes the rcu to go to the idle state.
// d_edge	input	d_edge is asserted by the edge_detect block whenever the d_plus line chages state. This will be used to detect the beginning of a packet from the idle state.
// eop	input	EOP will be asserted when the USB EOP signal is detected on the input lines. This flag indicates the end of a packet.
// shift_enable	input	This line is set high for 1 CLOCK CYCLE when SHIFT REGISTER is to shift in the NEXT BIT FORM D_orig line. Used to count number of bits received in order to store the data after an appropriate number of bits.
// rcv_data [7:0]	input	Contains the data in the shift register, and is used to compare the received value to ensure that it matches the SYNC byte.
// byte_received	input	The byte_received line will be asserted for 1 clock cycle each time a new byte has been shifted into the shift register.
// rcving	output	This line wil be set high when the circuitiing is receiving a packet.
// w_enable	output	This line enables the FIFO to read the byte currently in the shift register. It will be set high for 1 clock cycle after each complete byte has been received.
// r_error	output	This flag indicates an error occurred while receiving the packet. It will be asserted until the start of the next packet.
// 

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire eop,
	input wire shift_enable,
	input reg [7:0] rcv_data,
	input wire byte_received,
	output wire rcving,
	output wire w_enable, 
	output wire r_error
);

typedef enum bit [4:0] 
{
	//Data reading states
	IDLE, RCV_SYNC, BEGIN_RCV, SAVE_BYTE, CHECK_EOP, CHECK_DEDGE, CHECK_DEDGE_2, 
	//Error reading states
	ERROR, ERR_1, ERR_2, EIDLE
}
stateType;

stateType state;
stateType next_state;

reg next_w_enable;
reg current_w_enable;

reg next_r_error;
reg current_r_error;

reg next_rcving;
reg current_rcving;

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		state <= IDLE;
		current_w_enable <= 0;
		current_r_error <= 0;
		current_rcving <= 0;
	end
	else
	begin
		state <= next_state;
		current_w_enable <= next_w_enable;
		current_r_error <= next_r_error;
		current_rcving <= next_rcving;
	end
end

always_comb
begin: NEXT_STATE_AND_FLAG_LOGIC

	//Define default state behavior.
	next_state = state;
	next_rcving = current_rcving;
	next_w_enable = current_w_enable;
	next_r_error = current_r_error;

	//Next state behavior.
	case(state)
		(IDLE):
		begin	
			if(d_edge == 1)
			begin
				next_state = RCV_SYNC;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 0;
			end
			else
			begin
				next_state = IDLE;
				next_rcving = 0;
				next_w_enable = 0;
				next_r_error = 0;
			end
		end
		(RCV_SYNC):
		begin
			if(byte_received == 1)
			begin
				if(rcv_data == 8'b10000000)
				begin
					next_state = BEGIN_RCV;
					next_rcving = 1;
					next_w_enable = 0;
					next_r_error = 0;
				end
				else if(rcv_data != 8'b10000000)
				begin
					next_state = ERROR;
					next_rcving = 1;
					next_w_enable = 0;
					next_r_error = 1;
				end
			end
			else
			begin
				next_state = RCV_SYNC;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 0;
			end
		end
/*THIS IS IN THE CASE THAT CORRECT SYNC BYTE WAS NOT RECEIVED.*/
		(ERROR):
		begin
			if(eop == 1 && shift_enable == 1)
			begin
				next_state = ERR_1;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 1;
			end
			else
			begin
				next_state = ERROR;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 1;
			end
		end
		(ERR_1): 
		begin
			if(eop == 1 && shift_enable == 1)
			begin
				next_state = ERR_2;
				next_rcving = 0;
				next_w_enable = 0;
				next_r_error = 1;
			end
			else
			begin
				next_state = ERR_1;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 1;
			end
		end
		(ERR_2):
		begin
			if(eop == 1 && shift_enable == 1)
			begin
				next_state = EIDLE;
				next_rcving = 0;
				next_w_enable = 0;
				next_r_error = 1;
			end
			begin
				next_state = ERR_2;
				next_rcving = 0;
				next_w_enable = 0;
				next_r_error = 1;
			end
		end
		(EIDLE):
		begin
			if(d_edge == 1)
			begin
				next_state = RCV_SYNC;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 0;
			end
			else
			begin
				next_state = EIDLE;
				next_rcving = 0;
				next_w_enable = 0;
				next_r_error = 1;
			end
		end
/*THIS IS IN THE CASE THAT CORRECT SYNC BYTE WAS RECEIVED.*/
		(BEGIN_RCV):
		begin
			if(byte_received == 1)
			begin
				next_state = SAVE_BYTE;
				next_rcving = 1;
				next_w_enable = 1;
				next_r_error = 0;
			end
			else if(eop == 1 && shift_enable == 1)
			begin
				next_state = ERR_1;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 1;
			end
		end
		(SAVE_BYTE):
		begin
			next_state = CHECK_EOP;
			next_rcving = 1;
			next_w_enable = 0;
			next_r_error = 0;
		end
		(CHECK_EOP):
		begin
			if((shift_enable == 1) && (eop == 1))
			begin
				next_state = CHECK_DEDGE;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 0;
			end
			else if ((shift_enable == 1) && (eop == 0))
			begin
				next_state = BEGIN_RCV;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 0;	
			end
		end	
		(CHECK_DEDGE):
		begin
			if(d_edge == 1)
			begin
				next_state = ERROR;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 1;
			end
			else if(d_edge == 0)
			begin
				next_state = CHECK_DEDGE_2;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 0;
			end
		end
		(CHECK_DEDGE_2):
		begin
			if(d_edge == 1)
			begin
				next_state = IDLE;
				next_rcving = 0;
				next_w_enable = 0;
				next_r_error = 0;
			end
			else if(d_edge == 0)
			begin
				next_state = ERROR;
				next_rcving = 1;
				next_w_enable = 0;
				next_r_error = 1;
			end
		end
	endcase
end

assign rcving = current_rcving;
assign w_enable = current_w_enable;
assign r_error = current_r_error;

endmodule

