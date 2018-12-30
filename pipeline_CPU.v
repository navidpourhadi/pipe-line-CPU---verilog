module pipeline_CPU();
	wire [3:0] ALUControl;
	wire [4:0] addr2reg , addr1reg ;
	wire [63:0] dataA,dataB,dataC,inputPc,outputPc,signExOut,shiftOut,outputDataMem,result2InPc,result1InPc,ALUOut,ALU2In;
	wire [31:0] instruction;
	wire clk,zero ;
	reg reset;
	reg writepc;
	wire Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch ,UnCondBranch, ALUOp1 , ALUOp0;
	
	wire [95:0] IFID;
	wire [279:0] IDEX;
	wire [202:0] EXMEM;
	wire [134:0] MEMWB;

	initial begin
		writepc = 0;
		reset = 1;
	end
	always @(outputPc) begin
		writepc = 1;
		reset = 0;
	end



	os os0(clk);


	//registers for pipeline CPU

	pipeline_register #(.size(96)) IF_ID({
		outputPc,
		instruction
		},clk,IFID);

	pipeline_register #(.size(280)) ID_EX({
		IFID[4:0],
		IFID[31:21],
		signExOut,
		dataB,
		dataA,
		IFID[95:32],
		ALUOp1,ALUOp0,ALUSrc,
		Branch,MemRead,MemWrite,
		RegWrite,MemtoReg
		},clk,IDEX);

	pipeline_register #(.size(203)) EX_MEM({
		IDEX[279:275],
		IDEX[199:136],
		ALUOut,
		zero,
		result2InPc,
		IDEX[4 : 2],
		IDEX[1 : 0]
		},clk,EXMEM);

	pipeline_register #(.size(135)) MEM_WB({
		EXMEM[202:198],
		EXMEM[133:70],
		outputDataMem,
		EXMEM[1 : 0]
		},clk,MEMWB);

	//main units of cpu
	pc pc0(clk,inputPc,writepc,reset,outputPc);
	adder adder0(outputPc,64'd4,result1InPc);
	instructionMemory ins_mem(outputPc , instruction);
	control_unit control0(IFID[31:21],Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch ,UnCondBranch , ALUOp1 , ALUop0);
	MUX mux0(IFID [20:16] , IFID [4:0] , IFID[28] , addr2reg);
	registerBank32x64 regBank0(IFID [9:5] , addr2reg , MEMWB[134 : 130] ,MEMWB[1] , dataA , dataB , dataC , clk);
	signExtend signextend0(IFID [31:0] , signExOut);
	MUX mux1(IDEX[263 : 200] , IDEX[199 : 136] , IDEX[5] , ALU2In);
	AluControl alucontrol0(IDEX[6] , IDEX[7] , IDEX[274 : 264] ,ALUControl );
	ALU alu0(IDEX[135 : 72] , ALU2In , ALUControl , ALUOut , zero);
	shift2 shift(IDEX[263 : 200] , shiftOut);
	adder adder1(shiftOut , IDEX[71 : 8] , result2InPc);
	MUX mux2(result1InPc , EXMEM[133 : 70] , (EXMEM[69] & EXMEM[4]) | UnCondBranch , inputPc);
	DataMemory datamemory0(clk , MEMWB[129:66], EXMEM[197 : 134] , EXMEM[3] , EXMEM[2] , outputDataMem);
	MUX mux3(MEMWB[65:2] , MEMWB[129 : 66] , MEMWB[0] , dataC);


endmodule
