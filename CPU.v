module CPU();
	wire [3:0] ALUControl;
	wire [4:0] addr2reg , addr1reg ;
	wire [63:0] dataA,dataB,dataC,inputPc,outputPc,signExOut,shiftOut,outputDataMem,result2InPc,result1InPc,ALUOut,ALU2In;
	wire [31:0] instruction;
	wire clk,zero ;
	reg reset;
	reg writepc;
	wire Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch ,UnCondBranch, ALUOp1 , ALUOp0;
	os os0(clk);

	initial begin
		writepc = 0;
		reset = 1;
	end
	always @(outputPc) begin
		writepc = 1;
		reset = 0;
	end

	pc pc0(clk,inputPc,writepc,reset,outputPc);
	adder adder0(outputPc,64'd4,result1InPc);
	instructionMemory ins_mem(outputPc , instruction);
	control_unit control0(instruction[31:21],Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch ,UnCondBranch , ALUOp1 , ALUop0);
	MUX mux0(instruction [20:16] , instruction [4:0] , Reg2Loc , addr2reg);
	registerBank32x64 regBank0(instruction [9:5] , addr2reg , instruction[4:0] ,RegWrite , dataA , dataB , dataC , clk);
	signExtend signextend0(instruction , signExOut);
	MUX mux1(signExOut , dataB , ALUSrc , ALU2In);
	AluControl alucontrol0(ALUOp0 , ALUOp1 , instruction[31:21] ,ALUControl );
	ALU alu0(dataA , ALU2In , ALUControl , ALUOut , zero);
	shift2 shift(signExOut , shiftOut);
	adder adder1(shiftOut , outputPc , result2InPc);
	MUX mux2(result1InPc , result2InPc , (zero & Branch) | UnCondBranch , inputPc);
	DataMemory datamemory0(clk , ALUOut, dataB , MemRead , MemWrite , outputDataMem);
	MUX mux3(outputDataMem , ALUOut , MemtoReg , dataC);


endmodule



//ezafe kardan pipline ba ezafe kardan register
//ezafe kardan n b PC
//doros kardan signExtend
//delay ezafe kardan ba parametr
//delay with parameter *************