module RA (input	      clk,
	   input	      reset,
	   input       [3:0]  DataIn,
	   input       [3:0]  S,
	   input	      M,
	   input	      P0,
	   input	      A,
	   input       [3:0]  v,
	   input       [2:0]  adr,
	   output wire [3:0]  data);
				 
reg [3:0] RgA = 4 'b0000;
reg [3:0] ROM_data [7:0];

		
always@(posedge clk)
	if(reset)
		RgA = 4 'b0000;
		else 
			if(v[0]) 
				RgA = A ? DataIn : ROM_data[adr];				
assign data = RgA; 
endmodule
