// $Id: $
// File name:   sensor_b.sv
// Created:     1/20/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Behavioral Style Sensor Error Detector 

module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);

reg st1;
reg st2; 

always_comb 
begin

	st1 = sensors[3] | sensors[2]; //W + X
	st2 = sensors[1] & st1; //Y * (W + X)
	error = sensors[0] | st2; //Z + Y(W + X)

end

endmodule