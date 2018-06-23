// $Id: $
// File name:   flex_pts.sv
// Created:     2/1/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// clk	input	The system clock (400 MHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values (the common serial data bus idle value of '1').
// shift_enable	input	This is the active-high enable signal that allows the shift register to shift out the next value for the serial_out port.
// load_enable	input	This is the active-high enable signal that allows the shift register to load the value at the parallel_in port. If both the shift_enable and the load_enable are active, the load_enable takes priority. 
// parallel_out[(NUM_BITS - 1):0]	input	This is the data that will be loaded into the shift register when the load_enable signal is active. 
// serial_out	output	This is the serial output signal and thus will contain the data that is being serially transmitted from the shift register.
