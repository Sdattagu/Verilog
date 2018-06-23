// $Id: $
// File name:   sensor_s.sv
// Created:     1/20/2016
// Author:      Shounak Dattagupta
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: Module name is sensor_s. Required filename is: sensor_s.sv
// 
// Module has the following ports (case-sensitive port names):
// input wire [3:0] sensors
// output wire error

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);

wire int_worx;
wire int_yand;
wire int_result;

or worx (int_worx, sensors[3], sensors[2]);
and yand (int_yand, sensors[1], int_worx);
or result (error, sensors[0], int_yand);

endmodule