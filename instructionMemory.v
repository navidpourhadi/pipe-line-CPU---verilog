module instructionMemory #(parameter delay=0)(input[63:0] outpc,output[31:0] instruction);

	reg [31:0] memory [31:0];
	integer i;
	         
	initial
	begin
		for (i=0; i<32; i=i+1) memory[i] = 32'b0;
		memory[0]=32'h8B1F03E5;
		memory[1]=32'hF84000A4;
		memory[2]=32'h8B040086;
		memory[3]=32'hF80010A6;
	end
	
	assign #delay instruction =  memory[outpc[6:2]];

endmodule
