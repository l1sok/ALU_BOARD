module umu (input 	   clk,
	    input	   reset,
	    input	   CarryFlag,
	    input	   ZeroFlag,
	    output  [16:0] ControlBus,
	    output  [6:0]  PC_temp);
				
reg [6:0] PC = 7 'b0;
assign PC_temp  = PC;
reg [19:0] RAM [0:63];
initial $readmemb ("mem.txt", RAM);
wire [19:0] instr; 
wire PC_count = 1'b1;
wire [3:0] SUM = 4'b1001;
wire [4:0] outsum = 5'b00001;

assign instr = RAM[PC];
wire [2:0] cod_jupm;
assign cod_jupm [2:0] = instr[19:17];
wire [6:0] adr_jump;
assign adr_jump [6:0] = instr[6:0];
assign ControlBus[16:0] = (cod_jupm)? 17 'b0 : instr[16:0] ;
reg flag = 1'b0;
always@(posedge clk
	)
	if (reset)
		PC <= 7 'b0;
	else begin	
	case(cod_jupm)
		3 'b000:	flag = 1'b0;
		3 'b001: flag = !ZeroFlag;
		3 'b010: flag = !ZeroFlag&CarryFlag;
		3 'b011: flag = !ZeroFlag&!CarryFlag;
		3 'b100: flag = ZeroFlag;
		3 'b101: flag = ZeroFlag&CarryFlag;
		3 'b110:	flag = ZeroFlag&!CarryFlag;
		3 'b111: flag = 1'b1;
	endcase
	PC = flag ? adr_jump : (PC + 1'b1);
	end	
endmodule
