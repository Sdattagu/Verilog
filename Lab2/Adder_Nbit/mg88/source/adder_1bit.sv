// $Id: $
// File name:   adder_1bit.sv
// Created:     1/25/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Required module name is: adder_1bit
// Module must have the following ports (case-sensitive port names)
// 
// a	input		One of two primary inputs
// b	input 		Second of two primary inputs
// carry_in 	input	The overflow value carried in from a prior addition column
// sum 		output	The computer sum value
// carry_out 	output 	The overflow value sent to the next addition column
// 
// Equations for sum and carryout are below:
// 
// s = c_in xor (a xor b)
// c_out = ((not c_in) and b and a) or (c_in and (b or a))
//
// Note: Coding in structural style.
// 


module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,

	output wire sum,
	output wire carry_out
);

wire xorAB;
wire J;
wire K;
wire orAB;
wire L;

//Structural code for 1-bit sum logic.

xor AB1 (xorAB, a, b); //(a xor b).
xor S1 (sum, carry_in, xorAB); //sum = c_in xor (a xor b)

//Structural code for 1-bit carry_out logic.

and C_IB (J, (~carry_in), b); //(not c_in) and b
and aANDJ (K, J, a); //(((not c_in) and b) and a)
or AB2 (orAB, a, b); //b or a
and C_IAB2 (L, carry_in, orAB); //carry_in and (b or a)
or result (carry_out, K, L); //carry_out = (((not c_in) and b) and a) or (c_in and (b or a))

endmodule
