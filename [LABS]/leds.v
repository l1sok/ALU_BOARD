module leds (input   [9:0] SW,
             output [7:0] LEDG,
	     output [9:0] LEDR);
				
	assign LEDG[0]   =  SW[1] & SW[0];
	assign LEDR[8:5] = {4{SW[2] | SW[3]}};
endmodule
