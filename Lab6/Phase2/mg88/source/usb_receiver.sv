// $Id: $
// File name:   usb_receiver.sv
// Created:     2/29/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Top-level module

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

logic d_edge;
logic d_orig;
logic eop;

logic shift_enable;
logic byte_received;
logic [7:0] rcv_data;

logic w_enable;

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

edge_detect EDGE_DETECT
(
	.clk(clk),
	.n_rst(n_rst),
	.d_plus(d_plus_sync),
	.d_edge(d_edge)
);

decode DECODE
(
	.clk(clk),
	.n_rst(n_rst),
	.d_plus(d_plus_sync),
	.shift_enable(shift_enable),
	.eop(eop),
	.d_orig(d_orig)
);

eop_detect EOP_DETECT
(
	.d_plus(d_plus_sync),
	.d_minus(d_minus_sync),
	.eop(eop)
);

timer TIMER
(
	.clk(clk),
	.n_rst(n_rst),
	.d_edge(d_edge),
	.rcving(rcving),
	.shift_enable(shift_enable),
	.byte_received(byte_received)
);

shift_register S_R
(
	.clk(clk),
	.n_rst(n_rst),
	.shift_enable(shift_enable),
	.d_orig(d_orig),
	.rcv_data(rcv_data)
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


endmodule


