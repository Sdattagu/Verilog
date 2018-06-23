// $Id: $
// File name:   adder_4bit.sv
// Created:     1/25/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Required module name is: adder_4bit.
// Module must have exactly the following ports (case-sensitive port names).
// 
// a[3:0]	input		One of two primary inputs
// b[3:0]	input 		Second of two primary inputs
// carry_in	input	The overflow value carried in from a prior addition column
// sum[3:0] 	output	The computer sum value
// overflow 	output 	The overflow value from the calculation
//
// Note: Use structural style.


module adder_4bit
(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire carry_in,

	output wire [3:0] sum,
	output wire overflow
);

wire [4:0] carrys;
genvar i;

assign carrys[0] = carry_in;
generate
	for(i = 0; i <= 3; i = i + 1)
	begin 
		adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i + 1]));
	end
endgenerate
assign overflow = carrys[4];

endmodule

