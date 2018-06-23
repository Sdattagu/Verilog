// $Id: $
// File name:   adder_nbit.sv
// Created:     1/25/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Create a parameterized Ripple Carry Adder with a parameter called 'BIT_WIDTH' that determines the number of 
// bit pairs added and the size of the 'a' and 'b' ports. 
// The default value for this parameter must be 4.
// 
// Module must have exactly the following ports (case-sensitive port names):
// 
// a[#:0]	input	One of two primary inputs. The actual port declaration should use the BIT_WIDTH parameter value to determine the value of the '#'.
// b[#:0]	input	Second of two primary inputs. The actual port declaration should use the BIT_WIDTH parameter value to determine the value of the '#'.
// carry_in	input	The overflow value carried in from a prior addition column.
// sum[#:0]	output	The computer sum value. The actual port declaration should use the BIT_WIDTH parameter value to determine the value of the '#'.
// overflow	output	The overflow value from the calculation. 

module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
(
	input wire [(BIT_WIDTH - 1):0] a,
	input wire [(BIT_WIDTH - 1):0] b,
	input wire carry_in,
	output wire [(BIT_WIDTH - 1):0] sum,
	output wire overflow
);

wire [(BIT_WIDTH):0] carrys;
genvar i;

assign carrys[0] = carry_in;
generate
	for(i = 0; i <= (BIT_WIDTH - 1); i = i + 1)
	begin 
		adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i + 1]));
	end
endgenerate
assign overflow = carrys[(BIT_WIDTH)];

endmodule