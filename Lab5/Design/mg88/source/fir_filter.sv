// $Id: $
// File name:   fir_filter.sv
// Created:     2/15/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// clk	input	100 MHz system clock signal with a 50% duty cycle.
// n_rst	input	Active-low system reset.
// sample_data [15:0]	input	16-bit unsigned data input.
// fir_coefficient [15:0]	input	16-bit fixed-point coefficient [0.0, 1.0] to load.
// load_coeff	input	Active-high signal that indicates when FIR coefficients should be loaded.
// data_ready	input	Active-high signal that indicates when a sample is ready to be loaded.
// one_k_samples	output	Active-high signal indicating that 1,000 samples have been processed since the last assertion/power-on.
// modwait	output	Active-high signal indicating that the design is busy.
// fir_out [15:0]	output	The 16-bit unsigned FIR filter of the last four samples.
// err	output	Active-high signal indicating that an overflow occurred during averaging.
// 

module fir_filter
(
	input wire clk,
	input wire n_reset,
	input wire [15:0] sample_data,
	input wire [15:0] fir_coefficient,
	input wire data_ready,
	input wire load_coeff,
	output wire one_k_samples,
	output wire modwait,
	output wire [15:0] fir_out,
	output wire err
);

//Intermediate Nets
//Synchronized forms of the top-level inputs, map to sync_out port of the sync, input to controller. 
logic dr;
logic lc;

//Overflow, input to control unit, output from Datapath.
logic overflow;

//Counter enable signal, input to counter, output from controller.
logic cnt_up;

//Clear signal, input to counter, output from controller.
logic clear;

//opcode, src1, src2, and dest registers, inputs to Datapath, outputs from controller.
logic [2:0] op;
logic [3:0] src1;
logic [3:0] src2;
logic [3:0] dest;

//Outreg data register. Input to Magnitude, output from Datapath.
logic [16:0] outreg_data;

sync SYNCHRONIZE_DR
(
	.clk(clk),
	.n_rst(n_reset),
	.async_in(data_ready),
	.sync_out(dr)
);

sync SYNCHRONIZE_LC
(
	.clk(clk),
	.n_rst(n_reset),
	.async_in(load_coeff),
	.sync_out(lc)
);

controller SYSTEM_CONTROL_UNIT
(
	.clk(clk),
	.n_rst(n_reset),
	.dr(dr),
	.lc(lc),
	.overflow(overflow),
	.cnt_up(cnt_up),
	.clear(clear),
	.modwait(modwait),
	.op(op),
	.src1(src1),
	.src2(src2),
	.dest(dest),
	.err(err)
);

datapath DATAPATH
(
	.clk(clk),
	.n_reset(n_reset),
	.op(op),
	.src1(src1),
	.src2(src2),
	.dest(dest),
	.ext_data1(sample_data),
	.ext_data2(fir_coefficient),
	.outreg_data(outreg_data),
	.overflow(overflow)
);


counter COUNTER
(
	.clk(clk),
	.n_rst(n_reset),
	.cnt_up(cnt_up),
	.clear(clear),
	.one_k_samples(one_k_samples)
);

magnitude MAGNITUDE
(
	.in(outreg_data),
	.out(fir_out)
);

endmodule














