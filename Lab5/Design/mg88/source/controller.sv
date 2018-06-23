// $Id: $
// File name:   controller.sv
// Created:     2/15/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: 
// clk	input	100 MHz system clock signal with a 50% duty cycle.
// n_rst	input	Asynchronous active low system reset signal. When this signal is asserted, all FF values in the design are set immediately to logic 0.
// dr	input	This is the synchronized form of the data ready signal that signifies that the next sample data is ready.
// lc	input	This is the synchronized form of the load coeff signal that signifies that the next coefficient is ready to load.
// overflow	input	Indicates that an overflow occurred in the Datapath.
// cnt_up	output	This signal is the count enable for the counter. This signal should only be pulsed for 1 clock cycle (i.e. asserted for only 1 clock cycle and then cleared).
// clear	output	This signal is used to clear the counter to zero, when lc is asserted.
// modwait	output	This signal is to tell the external device connected to your design that the system is still processing the new data and the external device should wait.
// op[2:0]	output	Op-code for the Datapath. See description of Datapath.
// src1[3:0]	output	Operand for Datapath. See description of Datapath.
// src2[3:0]	output	Operand for Datapath. See description of Datapath.
// dest[3:0]	output	Operand for Datapath. See description of Datapath.
// err	output	Error flag. Asserted when an overflow from an addition is detected, and de-asserted when the next data sample is read in.
//

module controller
(
	input wire clk,
	input wire n_rst,
	input wire dr,
	input wire lc,
	input wire overflow,
	output reg cnt_up,
	output reg clear,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

typedef enum bit [4:0] 
{
	//dr signal states
	IDLE, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, MUL1, ADD1, MUL2, SUB1, MUL3, ADD2, MUL4, SUB2, LOAD, EIDLE,
	//lc signal states
	COEFF1, D1, COEFF2, D2, COEFF3, D3, COEFF4
}
stateType;

stateType state;
stateType next_state;

reg next_modwait;
reg current_modwait;

reg next_err;
reg current_err;

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		state <= IDLE;
		current_modwait <= 0;
		current_err <= 0;
	end
	else
	begin
		state <= next_state;
		current_modwait <= next_modwait;
		current_err <= next_err;
	end
end

always_comb
begin: NEXT_STATE_AND_FLAG_LOGIC

	//Define default state behavior.
	next_state = state;
	next_modwait = current_modwait;
	next_err = current_err;
	
	//Default flag behavior.
	cnt_up = 1'b0; //flag set low, counter off.
	op = 3'b000; //no op.
	src1 = 4'b0000;
	src2 = 4'b0000;
	dest = 4'b0000; //destination operand #3.
	//err = 1'b0;
	clear = 1'b0;

	//Rest is state diagram behavior from pseudo-code.
	case(state)
		(IDLE):
		begin
			if(dr == 1)
			begin
				next_state = STORE;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			else if(lc == 1)
			begin
				next_state = COEFF1;
				next_modwait = 1'b1;
				next_err = 1'b0;			
			end
			else
			begin
				next_state = IDLE;
				next_modwait = 1'b0;
				next_err = 1'b0;
			end

			//Set IDLE flag states.
			cnt_up = 1'b0; //We have not started the counter yet. We're still in IDLE.
			op = 3'b000; //NOP, we are not operating on src1, src2, and dest.
			src1 = 4'b0000; //4'b000 means the value of src1 is currently the value held within reg[0]. There are 16 registers within the Datapath register file. 
			src2 = 4'b0000; //4'b000 means the value of src2 is currently the value held within reg[0]. There are 16 registers within the Datapath register file. 
			dest = 4'b0000; //4'b000 means the value of dest is currently the value held within reg[0]. There are 16 registers within the Datapath register file.
			//err = 1'b0; //Nothing wrong yet.
			//next_err = 1'b0; 
			clear = 1'b1;
		end
/*FOLLOWING STATES ARE FOR LOADING COEFFICIENTS*/

		(COEFF1):
		begin
			//Next state happens regardless of input.
			next_state = D1;

			//Set COEFF1 flag states.
			cnt_up = 1'b0;
			op = 3'b011;
			src1 = 4'b0000;
			src2 = 4'b0000;
			dest = 4'd11;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b0;
		end
		(D1):
		begin
			if(lc == 1)
			begin
				next_state = COEFF2;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			else
			begin
				next_state = D1;
				next_modwait = 1'b0;
				next_err = 1'b0;
			end
			
			//Set D1 flag states.
			cnt_up = 1'b0;
			op = 3'b000;
			src1 = 4'b0000;
			src2 = 4'b0000;
			dest = 4'b0000; //destination operand #3.
			//err = 1'b0;
			clear = 1'b0;
		end
		(COEFF2):
		begin
			next_state = D2;

			//Set COEFF2 flag states.
			cnt_up = 1'b0;
			op = 3'b011;
			src1 = 4'b0000;	
			src2 = 4'b0000;
			dest = 4'd5;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b0;
		end
		(D2):
		begin
			if(lc == 1)
			begin
				next_state = COEFF3;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			else
			begin
				next_state = D2;
				next_modwait = 1'b0;
				next_err = 1'b0;
			end
			
			//Set D2 flag states.
			cnt_up = 1'b0;
			op = 3'b000;
			src1 = 4'b0000;
			src2 = 4'b0000;
			dest = 4'b0000; //destination operand #3.
			//err = 1'b0;
			clear = 1'b0;
		end
		(COEFF3):
		begin
			next_state = D3;

			//Set COEFF3 flag states.
			cnt_up = 1'b0;
			op = 3'b011;
			src1 = 4'd0;
			src2 = 4'd0;
			dest = 4'd4;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b0;
		end
		(D3):
		begin
			if(lc == 1)
			begin
				next_state = COEFF4;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			else
			begin
				next_state = D3;
				next_modwait = 1'b0;
				next_err = 1'b0;
			end

			//Set D3 Flag states.
			cnt_up = 1'b0;
			op = 3'b000;
			src1 = 4'b0000;
			src2 = 4'b0000;
			dest = 4'b0000; //destination operand #3.
			//err = 1'b0;
			clear = 1'b0;
		end
		(COEFF4):
		begin
			next_state = IDLE;
	
			//Set COEFF4 Flag states.
			cnt_up = 1'b0;
			op = 3'b011;
			src1 = 4'b0000;
			src2 = 4'b0000;
			dest = 4'd12;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b0;
		end

/*END COEFFICIENT LOADING STATES
  FOLLOWING STATES ARE FOR LOADING SAMPLE DATA*/
		(STORE):
		begin
			if(dr == 1)
			begin
				next_state = ZERO;
				next_modwait = 1'b1;
				next_err = 1'b0;
				
			end
			else if(dr == 0)
			begin
				next_state = EIDLE;
				next_modwait = 1'b0;
				next_err = 1'b1;
			end

			//Set STORE flag states.
			cnt_up = 1'b0;
			op = 3'b010; //LOAD1: store ext_data1 in register dest. 
			src1 = 4'b000; //We are not operating on src1, so it doesn't matter what we put here.
			src2 = 4'b000; //Same rationale as src1.
			dest = 4'd3; //We want ext_data1 loaded into reg[3]. This is how I have it in my pseudo-code.
			//err = 1'b0; //Nothing wrong yet.
			clear = 1'b0;
		end
		(ZERO):
		begin
			//Next state happens regardless of input conditions.
			next_state = SORT1;
			
			//Set ZERO flag states.
			cnt_up = 1'b0;
			op = 3'b101; //SUB: dest = src1 - src2
			src1 = 4'b0000; //src1 = reg[0]
			src2 = 4'b0000; //src2 = reg[0]
			dest = 4'd0; //dest = reg[0] = 0. 
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(SORT1):
		begin
			//Next state happens regardless of input conditions.
			next_state = SORT2;
			
			//Set SORT1 flag states.
			cnt_up = 1'b1; //COUNTER STARTS COUNTING
			op = 3'b001; //COPY: copy from register 'src1' to register 'dest'. reg[8] = reg[7]. Sample3 -> Sample4.
			src1 = 4'd7; 
			src2 = 4'd0;
			dest = 4'd8;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1; //System is now busy, since we're starting to rearrange the data samples.
		end
		(SORT2):
		begin
			//Next state happens regardless of input conditions.
			next_state = SORT3;
			
			//Set SORT2 flag states.
			cnt_up = 1'b0; //Counter already started counting in SORT1.
			op = 3'b001; //COPY: copy from register 'src1' to register 'dest'. reg[7] = reg[1]. Sample2 -> Sample3.
			src1 = 4'd1;
			src2 = 4'd0;
			dest = 4'd7;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1; //System is still busy.
		end
		(SORT3):
		begin
			//Next state happens regardless of input conditions.
			next_state = SORT4;

			//Set SORT3 flag states.
			cnt_up = 1'b0; //Counter already started counting in SORT1.
			op = 3'b001; //COPY: copy form register 'src1' to register 'dest'. reg[1] = reg[2]. Sample1 -> Sample2.
			src1 = 4'd2;
			src2 = 4'd0;
			dest = 4'd1;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(SORT4):
		begin
			//Next state happens regardless of input conditions.
			next_state = MUL1;

			//Set SORT4 flag states.
			cnt_up = 1'b0;
			op = 3'b001; //COPY: copy form register 'src1' to register 'dest'. reg[2] = reg[3]. Data -> Sample1.
			src1 = 4'd3;
			src2 = 4'd0;
			dest = 4'd2;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(MUL1):
		begin
			//Next state happens regardless of input conditions.
			next_state = ADD1;
			
			//Set MUL1 flag states.
			/*reg[6] = reg[8] * reg[12]; //Sample 4 * F3
			goto add1;*/
	
			cnt_up = 1'b0;	
			op = 4'b110; //MUL
			src1 = 4'd8;
			src2 = 4'd12;
			dest = 4'd6;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(ADD1):
		begin
			if(overflow == 1)
			begin
				next_state = EIDLE;
				next_modwait = 1'b0;
				next_err = 1'b1;
			end
			else if(overflow == 0)
			begin
				next_state = MUL2;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			
			//Set ADD1 flag states.
			/*reg[0] = reg[0] + reg[6]; //Add S4*F3 to accumulator.
			if(overflow) -> goto eidle
			else -> goto mul2*/

			cnt_up = 1'b0;
			op = 4'b100; //ADD
			src1 = 4'd0;
			src2 = 4'd6;
			dest = 4'd0;
			//next_err = 1'b0;
			clear = 1'b0;
		end
		(MUL2): 
		begin	
			//Next state happens regardless of input conditions.
			next_state = SUB1;
		
			//Set MUL2 flag states.
			/*reg[6] = reg[7] * reg[4]; //Sample 3 * F2
			goto sub1;
			*/
			
			cnt_up = 1'b0;
			op = 4'b110; //MUL
			src1 = 4'd7;
			src2 = 4'd4;
			dest = 4'd6;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(SUB1):
		begin
			if(overflow == 1)
			begin
				next_state = EIDLE;
				next_modwait = 1'b0;
				next_err = 1'b1;
			end
			else if(overflow == 0)
			begin
				next_state = MUL3;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end

			//Set SUB1 flag states.
			/*reg[0] = reg[0] - reg[6]; //Subtract S3*F2 from accumulator.
			if(overflow) -> goto eidle
			else -> goto mul3;*/

			cnt_up = 1'b0;
			op = 4'b101; //SUB
			src1 = 4'd0;
			src2 = 4'd6;
			dest = 4'd0;
			//err = 1'b0;
			//next_err = 1'b0;
			clear = 1'b0;
		end
		(MUL3):
		begin
			//Next state happens regardless of input conditions.
			next_state = ADD2;
		
			//Set MUL3 flag states.
			/*reg[6] = reg[1] * reg[5]; //Sample 2 * F1
			goto add2;*/

			cnt_up = 1'b0;
			op = 4'b110; //MUL
			src1 = 4'd1;
			src2 = 4'd5;
			dest = 4'd6;
			//err = 1'b0;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(ADD2):
		begin
			if(overflow == 1)
			begin
				next_state = EIDLE;
				next_modwait = 1'b0;
				next_err = 1'b1;
			end
			else if(overflow == 0)
			begin
				next_state = MUL4;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			
			//Set ADD2 flag states.
			/*reg[0] = reg[0] + reg[6]; //Add S2*F1 to accumulator.
			if(overflow) -> goto eidle
			else -> goto mul4;*/

			cnt_up = 1'b0;
			op = 4'b100; //ADD
			src1 = 4'd0;
			src2 = 4'd6;
			dest = 4'd0;
			//err = 1'b0;
			//next_err = 1'b0;
			clear = 1'b0;
		end
		(MUL4):
		begin
			//Next state happens regardless of input conditions.
			next_state = SUB2;
		
			//Set MUL4 flag states.
			/*reg[6] = reg[2] * reg[11]; //Sample 1 * F0
			goto sub2;*/

			cnt_up = 1'b0;
			op = 4'b110; //MUL
			src1 = 4'd2;
			src2 = 4'd11;
			dest = 4'd6;
			//err = 1'b0;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b1;
		end
		(SUB2):
		begin
			if(overflow == 1)
			begin
				next_state = EIDLE;
				next_modwait = 1'b0;
				next_err = 1'b1;
			end
			else if(overflow == 0)
			begin
				next_state = LOAD;
				next_modwait = 1'b0;
				next_err = 1'b0;
			end			
			
			//Set SUB2 flag states.
			/*reg[0] = reg[0] - reg[6]; //Subtract S1*F0 from accumulator.
			if(overflow) -> goto eidle
			else -> goto idle;*/

			cnt_up = 1'b0;
			op = 4'b101; //SUB
			src1 = 4'd0;
			src2 = 4'd6;
			dest = 4'd0;
			//err = 1'b0;
			//next_err = 1'b0;
			clear = 1'b0;
		end
		(LOAD):
		begin
			//Next state happens regardless of input conditions.
			next_state = IDLE;

			//Set LOAD flag states.
			cnt_up = 1'b0;
			op = 3'b000; //no op.
			src1 = 4'b000;
			src2 = 4'b000;
			dest = 4'b000; //destination operand #3.
			//err = 1'b0;
			next_err = 1'b0;
			clear = 1'b0;
			next_modwait = 1'b0;
		end		
		(EIDLE):
		begin
			if(dr == 1)
			begin
				next_state = STORE;
				next_modwait = 1'b1;
				next_err = 1'b0;
			end
			else if(dr == 0)
			begin
				next_state = EIDLE;
				next_modwait = 1'b0;
				next_err = 1'b1;
			end
		
			//Set EIDLE flag states.
			/*	err = 1;
				if(data_ready == 1) -> goto store;
				if(data_ready == 0) -> goto eidle;
			*/
			
			cnt_up = 1'b0;
			op = 4'b000;
			src1 = 4'b0000;
			src2 = 4'b0000;
			dest = 4'b0000;
			//err = 1'b1;
			clear = 1'b0;
		end
	endcase
end

/*END SAMPLE LOADING STATES.*/


assign modwait = current_modwait; //Registering the output.
assign err = current_err;

endmodule


			


	
			




















