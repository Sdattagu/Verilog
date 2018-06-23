// $Id: $
// File name:   rcv_block.sv
// Created:     2/9/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// clk			input	The system clock (400 MHz)
// n_rst		input	This is an asynchronous, active-low sytem reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values.
// serial_in		input	This is the serial input signal and thus will contain the data that is being serially transmitted to the UART. If a packet is not being transmitted, this line will be a logic '1'.
// data_read		input	This is the active-high handshake signal for the data buffer and is asserted by an external device when it has read the available data.
// rx_data[7:0]		output	This is the 8-bit data that has been received by the UART signal and is available for reading by an external device.
// overrun_error 	output	This is an active high flag signal that reports if an overrun error condition has occurred. It is cleared when an external device reads the available data.
// framing_error	output	This is an active-high flag signal that reports if a framing error occurred with the current/most recently received packet. It is cleared when a new packet is starting to be received.
// 

module rcv_block
(
	input wire clk,
	input wire n_rst,
	input wire serial_in,
	input wire data_read,
	output reg [7:0] rx_data,
	output wire data_ready,
	output wire overrun_error,
	output wire framing_error
);

//These are the error signals for port mapping the I/O of the RCU.
//wire framing_error; //framing error control signal
reg sbc_clear, sbc_enable; //Control signals for stop-bit
reg load_buffer; //Control signal for buffer load

//This start bit flag is used as the output signal for start_bit_det
reg start_bit_flag;

//These are I/O signals used to port map timer.
reg enable_timer, packet_done, shift_strobe;

//These are I/O for sr_9bit.
reg [7:0] packet_data; //8-bit data output from sr_9bit.
reg stop_bit;

//Start up the rcu so that we can receive the various errors.
rcu RCU (.clk(clk), .n_rst(n_rst), .framing_error(framing_error), .packet_done(packet_done), .start_bit_detected(start_bit_flag), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), .enable_timer(enable_timer));

//When IDLE, serial input will always have 1.
//Receiver knows when start bit is detected.
start_bit_det START_BIT_DETECT (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .start_bit_detected(start_bit_flag));

//Start bit detected, start the timer.
//Timer has logic to sample data near the center of each bit.
timer TIMER(.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .shift_strobe(shift_strobe), .packet_done(packet_done));

//Pass shift_strobe signal from timer, 8-bit packet data, and stop_bit into the shift register. 
sr_9bit SHIFT(.clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit));

//Serial data is then followed by a stop bit
stop_bit_chk STOP_BIT_CHECKER(.clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(framing_error));

//Run the receive data buffer logic to output to external device
rx_data_buff RX_DATA_BUFF(.clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));


endmodule



