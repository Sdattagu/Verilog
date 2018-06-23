// $Id: $
// File name:   magnitude.sv
// Created:     2/15/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// If the FIR algorithm produces negative output from the datapath, this block will
// output the positive magnitude on fir_out instead. 
// Otherwise, this block will pass the datapath's out_reg value on to fir_out.
// This is desired as this block works with negative coefficients and the samples
// are unsigned, thus the output should be unsigned as well.
// The negative output will be in 2's compliment format and will have to be converted to the positive form of 2's compliment should the outreg_data of the datapath
// have a negative number on it.
// 
//in [16:0]	input	Input port to be filtered for negatives, connect to outreg_data.
//out [15:0]	output	Outputs magnitude filtered form of input.

module magnitude
(
	input wire [16:0] in,	
	output wire [15:0] out
);

//This 17-bit register contains all 1's and is used to perform 2's complement.
//reg[16:0] intermediate;
//assign intermediate = 17'b11111111111111111;

/*always_comb
begin
	if(in[16] == 1)
	begin
		in = intermediate - in;
		in = in + 17'h1;
		out = in[15:0];
		//out = (~in [15:0]) + 1;
	end
	
	else if(in[16] == 0)
	begin
		out = in[15:0];
	end
end*/

assign out = in[16] ? (~in[15:0] + 1) : (in[15:0]);

endmodule

