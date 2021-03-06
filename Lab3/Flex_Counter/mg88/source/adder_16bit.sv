// $Id: $
// File name:   adder_16bit.sv
// Created:     1/27/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 16 bit adder based on 8-bit adder wrapper file. 8-bit adder is based on n-bit adder, which is based on 1-bit adder. 
// 
// Module must have exactly the following ports (case-sensitive port names):
// 
// a[15:0]	input	One of two primary inputs 
// b[15:0]	input	Second of two primary inputs
// carry_in	input	The overflow value carried in from a prior condition 
// sum[15:0]	output	The computed sum value
// overflow	output	The overflow value from the calculation
// 

`timescale 1ns / 100ps

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	
	/*always @ (a, b)
	begin
		#(2) assert((a == 1'b1) || (a == 1'b0) || (b == 1'b1) || (b == 1'b0))
		else $error("Inputs are incorrect");
	end */
	
	genvar i;

	//assign carrys[0] = carry_in;
	generate
	for(i = 0; i <= 15; i = i + 1)
	begin 
		//adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i + 1]));
		always @ (a[i])
		begin
			assert((a[i] == 1'b1) || (a[i] == 1'b0))
			else $error("Input 'a' of component is not a digital logic value");
			assert((b[i] == 1'b1) || (b[i] == 1'b0))
			else $error("Input 'b' of component is not a digital logic value");
			assert((carry_in == 1'b1) || (carry_in == 1'b0))
			else $error("Input 'carry_in' of component is not a digital logic value");
		end
	end
	endgenerate
	
	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
	adder_nbit #(16) IX (.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));
	
	always @ (a, b, carry_in)
	begin	
			#(2) assert(((a + b + carry_in) % 2) == sum)
			else $error("Output 's' of first 1 bit adder is not correct");
	end

endmodule

