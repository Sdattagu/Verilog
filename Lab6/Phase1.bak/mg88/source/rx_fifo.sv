// $Id: $
// File name:   rx_fifo.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// FIFO buffer allows the receiver to store data for a period until the microcontroller has a chance to read the data. 
// This is a wrapper file of the FIFO provided in ECE337_IP. 
// 
// clk	input	This is the READ clock signal, rclk. This clock signal is used by the FIFO to keep track of the current read address. This is also the WRITE clock signal, wclk. This clock signal is used by the FIFO to (1) latch data into the FIFO's RAM at its rising edge and when w_enable is asserted (Logic '1'), and to (2) Keep track of the current write address.
// 
// n_rst	input	This is the RESET signal. When this signal is asserted low (logic '0'), all registered element's outputs are set to their reset logic value (the entire FIFO contents are cleared).
// r_enable	input	This is the READ enable signal. When this signal is asserted (logic '1'), the READ pointed is incremented at the rising edge of the READ clock. The purpose of this signal is to let the FIFO know that the current data being pointed to by the READ pointed has been read.
// w_enable	input	This is the WRITE enable signal. When this signal is asserted (logic '1'), (1) the data on the w_data bus is latched into the FIFO's RAM at the rising edge of the WRITE clock and (2) WRITE pointer is incremented at the rising edge of the WRITE clock.
// w_data [7:0]	input	This is the WRITE data bus. This bus holds the data to be written to the FIFO's RAM at the rising edge of the WRITE clock and while the WRITE enable signal is held high (logic '1').
// r_data [7:0]	output	This is the READ data bus. This bus holds the data to which the READ pointer is currently positioned (the next piece of data to be read from the FIFO's RAM).
// empty	output	This is the empty flag. When this signal is asserted (logic '1'), the FIFO is empty.
// full	output	This is the FULL flag. When this signal is asserted (logic '1'), the FIFO is full.
// 

module rx_fifo
(
	input wire clk,
	input wire n_rst,
	input wire r_enable,
	input wire w_enable,
	input reg w_data [7:0],
	output reg r_data [7:0],
	output reg empty,
	output reg full
);

fifo FIFO
(
	.r_clk(clk), 
	.w_clk(clk), 
	.n_rst(n_rst), 
	.r_enable(r_enable), 
	.w_enable(w_enable), 
	.w_data(w_data), 
	.r_data(r_data), 
	.empty(empty), 
	.full(full)
);


endmodule


 