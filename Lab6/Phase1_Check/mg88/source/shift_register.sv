// $Id: $
// File name:   shift_register.sv
// Created:     2/28/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// The shift register will store 1 byte of incoming values and hold those values while they are read into the FIFO buffer. 
// The USB data is sent LSB first, so the shift register should shift so that the data ultimately has the least-significant 
// (first) bit on the right, and the MSB on the left.
// 
// clk			input	The system clock (96 MHz), all shifting will occur on the rising edge of clk.
// n_rst		input	This is asynchronous, active-low system reset, which causes the shift register to be reset to all 0's.
// shift_enable		input	The shift register will only perform a shift on the rising edge of clk and when the shift_enable line is asserted.
// d_orig		input	This is the decoded input data to be shifted in. This signal is connected to the MSB of the shift register to allow the data to be shifted LSB first.
// rcv_data [7:0]	output	The rcv_data [7:0] bus contains the value stored in each of the shift registers. This value will be read after each byte is received and stored into the FIFO buffer.
// 

module shift_register
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire d_orig,
	output wire [7:0] rcv_data
);


flex_stp_sr #(8, 0) SHIFT_REGISTER
(
	.clk(clk),	
	.n_rst(n_rst),
	.shift_enable(shift_enable),
	.serial_in(d_orig),
	.parallel_out(rcv_data)
);


/*module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input reg serial_in,
	output reg [(NUM_BITS - 1):0] parallel_out
);*/

/*flex_counter #(4) CLOCK_DIVIDER
(
	.clk(clk),
	.n_rst(n_rst),
	.clear(d_edge | !rcving), //d_edge is synchronous reset, so is rcving (when low). Either condition can be met (OR)
	.count_enable(rcving),
	.rollover_val(4'd8),
	.count_out(intermediate_count_out)
	//.rollover_flag(byte_received)
);*/

endmodule







 