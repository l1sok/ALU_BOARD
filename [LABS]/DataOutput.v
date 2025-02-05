module DataOutput (input	      clk,
		   input	      Reset,
		   input              wr, 
		   input      [3:0]   Data,
		   input      [1:0]   PortID, 
		   output reg [15:0]  Indicator);


always @ (posedge clk)
	if (Reset) Indicator <= 16'b0;
		else if (wr)
			case (PortID)
				0: Indicator[3:0]   <= Data;
				1: Indicator[7:4]   <= Data;
				2: Indicator[11:8]  <= Data;
				3: Indicator[15:12] <= Data;
			endcase
endmodule
