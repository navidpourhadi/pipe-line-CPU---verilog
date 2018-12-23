module CPU();
	wire [3:0] ALUControl;
	wire [4:0] addr2reg , addre1reg ;
	wire [63:0] dataA,dataB,dataC,inputPc,outputPc,signExOut,shiftOut,outputDataMem;
	wire [31:0] instruction;
	wire clk,zero ;
	wire reset,writepc;
	wire Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch , ALUOp1 , ALUop0;
	os os0(clk);
	//testbench testbench0(a,b,c,w,clk,dataC);
	pc pc0(clk,inputPc,writepc,reset,outputPc);
	adder adder0(outputPc,4,result1InPc);
	instructionMemory ins_mem(outputPc , instruction);
	MUX mux0(instruction [20:16] , instruction [9:5] , Reg2Loc , addr2reg);
	registerBank32x64 regBank0(addr1reg , addr2reg , instruction[4:0] ,RegWrite , dataA , dataB , dataC , clk);
	signExtend signextend0(instruction , signExOut);
	MUX mux1(signExOut , dataB , ALUSrc , ALU2In);
	alu_control(ALUOp0 , ALUOp1 , instruction[31:21] ,ALUControl );
	alu alu0(dataA , ALU2In , ALUControl , ALUOut , zero);
	shift2 shift(signExOut , shiftOut);
	adder adder1(shiftOut , outputPc , result2InPc);
	MUX mux2(result1InPc , result2InPc , zero & Branch , inputPc);
	datamemory datamemory0(clk , ALUOut, dataB , MemRead , MemWrite , outputDataMem);
	MUX mux3(ALUOut , outputDataMem , MemtoReg , dataC);
	control control0(instruction[31:21],Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch , ALUOp1 , ALUop0);

endmodule




//delay with parameter *************