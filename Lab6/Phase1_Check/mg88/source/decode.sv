// $Id: $
// File name:   decode.sv
// Created:     2/23/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// 
// Responsible for removing the NRZ encoding described in Section 2 from the incoming data. 
// Block will STORE THE INCOMING BIT PRESENT when SHIFT_ENABLE IS HIGH
// Output a 1 AS LONG AS THE CURRENT INPUT AND STORED VALUE MATCH
// Output a 0 IF CURRENT INPUT AND STORED INPUT DIFFER.
// 
// Block should synchronously reset to an idle-line state when an EOP is detected at the same time as a shift enable.
// 
// clk		input	The system clock (96 MHz), will be used to latch the data into the stored bit when shift_enable is high.
// n_rst	input	This is an asynchronous, active-low system reset. When this line is low, the stored bit will immediately go to the idle-line state.
// d_plus	input	The incoming NRZ-encoded data.
// shift_enable	input	This signal enables the bit on d_plus to replace the stored bit on the rising edge of clk.
// eop		input	This is a synchronous reset signal that causes the sotred bit to return to the idle-line state. It must only have an effect while shift_enable is high.
// d_orig	output	The decoded data.
// 

module decode
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire shift_enable,
	input wire eop,
	output reg d_orig
);

logic next_dplus;
logic last_dsync;
logic next_dsync;
logic XNOR;

always_comb
begin: MUX_WITH_SHIFT_ENABLE_SELECT
	if(shift_enable == 1) 
	begin
		next_dplus = d_plus;
	end
	else if(shift_enable == 0)
	begin
		next_dplus = last_dsync;
	end
end

always_comb
begin: MUX_WITH_EOP_SELECT
	if(eop == 1 && shift_enable == 1)
	begin
		next_dsync = 1;
	end
	else
	begin
		next_dsync = next_dplus;
	end
end

always_ff @ (posedge clk)
begin: LAST_DSYNC_REG
	if(n_rst == 0)
	begin
		last_dsync <= 1;
	end
	else
	begin
		last_dsync <= next_dsync;
	end
end 

always_ff @ (posedge clk)
begin: OUTPUT_DORIG
	if(n_rst == 0)
	begin
		d_orig <= 1;
	end
	else if(eop == 1 & shift_enable == 1)
	begin
		d_orig <= 1;
	end
	else
	begin
		d_orig <= (d_plus ~^ last_dsync);
	end
end
	
//assign d_orig = (eop == 1 & shift_enable == 1) ?  1 : (d_plus ~^ last_dsync);


endmodule

		

/*always_ff @ (posedge clk)
begin: SHIFT_LOGIC
	if(n_rst == 1'b0)
	begin
		stored_d_plus <= 1; //Idle - no transition.
	end

	//Simulate the MUX behavior.
	else if(shift_enable == 1)
	begin
		stored_d_plus <= d_plus; //Store the bit in a register.
	end
	else if(shift_enable == 0)
	begin
		stored_d_plus <= stored_d_plus; //Basically stored_d_plus is not updated.
	end
end

always_comb
begin: GET_D_ORIG_VIA_XOR
	
	//Avoid Latches
	//stored_d_plus = stored_d_plus;
	//d_plus = d_plus;

	XOR = d_plus ^ stored_d_plus; //bit-wise XOR of d_plus and stored d_plus.
end

assign next_d_orig = XOR;

always_ff @ (posedge clk)
begin: OUTPUT_DORIG
	if(n_rst == 1'b0)
	begin
		d_orig <= 0;
	end
	else
	begin
		d_orig = next_d_orig;
	end
end
*/





