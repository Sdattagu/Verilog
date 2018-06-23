// $Id: $
// File name:   timer.sv
// Created:     2/9/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: clk	input	The system clock (400 MHz)
// n_rst	input	This is an asynchronous, active-low system reset. When this line is asserted (logic '0'), all registers/flip-flops in the device must reset to their initial values.
// enable_timer	input	This is the enable signal for thetimer.
// shift_strobe	output	This is the active-high one (1) clock cycle pulse signal that commands the 9-bit shift register to shift in the value of the serial_in signal.
// packet_done	output	This is the flag signal to the RCU that reports when all the needed bits from the current packet has been captured.
// 

module timer
(
	input wire clk, n_rst, enable_timer,
	output wire shift_strobe, packet_done
);

logic [3:0] count_TEN; //This is the register that will hold the count_out value for the 10_flex_counter.
logic [3:0] count_NINE; //This is the register that will hold the count_out value for the 9_flex_counter.
//logic intermediate_delay; //Used to generate some delay.
//reg delayed_enable; //The timer delayed by one bit, used in the 10_flex_counter instead of the provided enable_timer.

/*always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		intermediate_delay <= 0;
		delayed_enable <= 0;
	end
	else
	begin
		intermediate_delay <= enable_timer;
		delayed_enable <= intermediate_delay;
	end
end*/

//LOGIC: Run two instances of flex_counter. Since the clock runs at 400 MHz, but signals are received at 40 MHz, we want to slow down bit-receival.
//First flex_counter counts to 10 to accomplish 1/10 rate of reading bits. Second flex_counter then increments for each bit (9). 
//First flex_counter outputs strobe signal to second flex_counter, tells it to increment by 1.
//Second flex_counter outputs packet_done once it counts all 9 bits.

//10_flex_counter instance. Receives enable_timer as input. Outputs shift_strobe.
flex_counter #(4) X (.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(enable_timer), .rollover_val(4'b1010), .count_out(count_TEN), .rollover_flag(shift_strobe));

//assign shift_strobe = (count_TEN == 5); 

//9_flex_counter instance. Runs off of shift_strobe from 10_flex_counter. Outputs packet_done once it's finished with the packet.
flex_counter #(4) IX (.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(shift_strobe), .rollover_val(4'b1001), .count_out(count_NINE), .rollover_flag(packet_done));

endmodule
