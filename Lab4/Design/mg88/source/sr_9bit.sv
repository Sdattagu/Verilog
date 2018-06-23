// $Id: $
// File name:   sr_9bit.sv
// Created:     2/9/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is a 9-bit Shift Register that will shift the serial data received.
// 
// This should be a wrapped file that uses my flex_stp_sr.sv design, from Lab 3. 
// 
// clk	input	The system clock (400 MHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values.
// shift_strobe	input	this is the active-high one (1) clock cycle pulse signal that commands the 9-bit shift register to shift in the value of the serial_in signal.
// serial_in	input	This is the serial input signal and thus will contain the data that is being serially transmitted to the UART. If a packet is not being transmitted, this line will be a logic '1'.
// packet_data [7:0] output	This is the 8-bit data that was sent in the currently received packet.
// stop_bit	output	This is the value of the Stop-bit that was received in the packet.
// 

module sr_9bit
(
	input wire clk,
	input wire n_rst,
	input wire shift_strobe,
	input reg serial_in,
	output reg [7:0] packet_data,
	output wire stop_bit
);

//Declare an intermediate 9-bit register which will be passed into flex_stp_sr as the parallel_out register.
reg [8:0] intermediate_parallel_out;

//This 9-bit shift register is a serial-to-parallel sr. It uses my flex_stp_sr to perform serial to parallel on packet_data.
//Pass intermediate_parallel_out as 9-bit register to receive 9-bit parallel output from the serial_input.
//NOTE: The shift enable for the shift register is dictated by the status of shift_strobe from the timer module.
flex_stp_sr #(9, 0) IX (.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out(intermediate_parallel_out));

//Then, we can assign bits 0-7 as the 8-bit packet_data, and bit 9 as the stop-bit.
assign packet_data = intermediate_parallel_out [7:0];
assign stop_bit = intermediate_parallel_out[8];

endmodule

