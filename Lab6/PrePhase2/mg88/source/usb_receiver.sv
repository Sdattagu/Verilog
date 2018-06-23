// $Id: $
// File name:   usb_receiver.sv
// Created:     2/29/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Top-level block for USB design.
// 
// clk		input	This is the system clock (96 MHz), all state transitions will occur on the rising edge of the clk.
// n_rst	iput	This is an asynchronous, active-low system reset, which causes the RCU to go to the idle state.
// d_plus	input	The positive USB input line.
// d_minus	input	The negative USB input line.
// r_enable	input	This is the read enable signal. 
// r_data [7:0]	output	This is the read data bus. 
// empty	output	This is the empty flag. When this signal is asserted (logic '1'), the FIFO is empty.
// full	output	This is the FULL flag. When this signal is asserted, the FIFO is full.
// rcving	output	This line will be set high when the circuit is receiving a packet.
// r_error	output	The flag indicates an error occurred while receiving the packet. It will be asserted until the start of the next packet.
// 

module usb_receiver
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire r_enable,
	output reg [7:0] r_data,
	output wire empty,
	output wire full,
	output wire rcving,
	output wire r_error
);

logic d_plus_sync;
logic d_minus_sync;

sync_high SYNC_HIGH
(
	.clk(clk),
	.n_rst(n_rst),
	.async_in(d_plus),
	.sync_out(d_plus_sync)
);

sync_low SYNC_LOW
(
	.clk(clk),
	.n_rst(n_rst),
	.async_in(d_minus),
	.sync_out(d_minus_sync)
);

logic shift_enable; //Also in timer
logic eop;
logic d_orig; //Also used in shift register.

decode DECODE
(
	.clk(clk),
	.n_rst(n_rst),
	.d_plus(d_plus_sync),
	.shift_enable(shift_enable),
	.eop(eop),
	.d_orig(d_orig)
);

logic d_edge; //Also in timer

edge_detect EDGE_DETECT
(
	.clk(clk),
	.n_rst(n_rst),
	.d_plus(d_plus_sync),
	.d_edge(d_edge)
);

eop_detect EOP_DETECT
(
	.d_plus(d_plus_sync),
	.d_minus(d_minus_sync),
	.eop(eop)
);

logic byte_received;

timer TIMER
(
	.clk(clk),
	.n_rst(n_rst),
	.d_edge(d_edge),
	.rcving(rcving),
	.shift_enable(shift_enable),
	.byte_received(byte_received)
);  

logic [7:0] rcv_data; 

shift_register S_R
(
	.clk(clk),
	.n_rst(n_rst),
	.shift_enable(shift_enable),
	.d_orig(d_orig),
	.rcv_data(rcv_data)
);

logic w_enable;
//logic [7:0] w_data;

rx_fifo RX_FIFO
(
	.clk(clk),
	.n_rst(n_rst),
	.r_enable(r_enable),
	.w_enable(w_enable),
	.w_data(rcv_data),
	.r_data(r_data),
	.empty(empty),
	.full(full)
);

rcu RCU
(
	.clk(clk),
	.n_rst(n_rst),
	.d_edge(d_edge),
	.eop(eop),
	.shift_enable(shift_enable),
	.rcv_data(rcv_data),
	.byte_received(byte_received),
	.rcving(rcving),
	.w_enable(w_enable),
	.r_error(r_error)
);

endmodule

	