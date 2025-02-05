module RALU (    input			clk,
		 input			reset,
	         input         [3:0]    DataIn,
	         input         [3:0]    S,
		 input			M,
		 input			P0,
		 input			A,
	         input         [3:0]    v,
	         input         [2:0]   adr,
		 input			wr,
		 output	reg             OSR,
		 input 			ISR,
		 output	reg	        OSL,
		 input			ISL,
		 output			P4,
		 output        [3:0]   	R);
				 
reg	[3:0] RgA = 4 'b0000;
reg	[3:0] RgB = 4 'b0000;
wire	[4:1]	P;
assign P4 = P[4];
reg [3:0] ROM_data [7:0];

		
always@(posedge clk)
	if(reset)
		RgA = 4 'b0000;
		else
			if(v[0]) 
				RgA = A ? DataIn : ROM_data[adr];
		
always@(posedge clk)
	if(reset)
		RgB = 4 'b0000;
	else
	case(v[2:1])
		2 'b01:
		begin
			OSL <= RgB[3];
			RgB <= RgB << 1;
			RgB[0] <= ISL;
		end
		2 'b10:
		begin
			OSR <= RgB[0];
			RgB <= RgB >> 1;
			RgB[3] <= ISR;
		end
		2 'b11: RgB <= ROM_data[adr];
	endcase
	
always@(posedge clk)
	if(reset)
		begin
			ROM_data [0] = 4 'b0000; ROM_data [1] = 4 'b0000; ROM_data [2] = 4 'b0000; ROM_data [3] = 4 'b0000; 
			ROM_data [4] = 4 'b0000; ROM_data [5] = 4 'b0000; ROM_data [6] = 4 'b0000; ROM_data [7] = 4 'b0000;
		end
	else
	if (wr)
		ROM_data[adr] <= R;

ALU_ParallelCarry ALU (	.A(RgA),
						.B(RgB),
						.S(S),
						.M(M),
						.P0(P0),
						.R(R),
						.P(P)	);	
endmodule
