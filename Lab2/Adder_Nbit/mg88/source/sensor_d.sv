// $Id: $
// File name:   sensor_d.sv
// Created:     1/20/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Dataflow Style Sensor Error Detector

module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);

wire st1;
wire st2; 

assign st1 = sensors[3] | sensors[2]; //W + X
assign st2 = sensors[1] & st1; //Y * (W + X)
assign error = sensors[0] | st2; //Z + Y(W + X)

endmodule