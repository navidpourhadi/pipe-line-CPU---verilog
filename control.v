module control_unit (input[10:0] instruction ,output reg Reg2Loc, ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite , Branch , ALUOp1 , ALUop0);

always @(*) begin 
casex (instruction)
11'b1xx0101x000:
begin
Reg2Loc = 0;
ALUSrc = 0;
MemtoReg = 0;
RegWrite = 1;
MemRead = 0 ;
MemWrite = 0;
Branch = 0;
ALUOp1 = 1;
ALUop0 = 0;
end 
11'b11111000010:
begin
Reg2Loc = 0;
ALUSrc = 1;
MemtoReg = 1;
RegWrite = 1;
MemRead = 1 ;
MemWrite = 0;
Branch = 0;
ALUOp1 = 0;
ALUop0 = 0;
end
11'b11111000000:
begin
Reg2Loc = 1;
ALUSrc = 1;
MemtoReg = 0;
RegWrite = 0;
MemRead = 0 ;
MemWrite = 1;
Branch = 0;
ALUOp1 = 0;
ALUop0 = 0;
end
11'b10110100xxx:
begin
Reg2Loc = 1;
ALUSrc = 0;
MemtoReg = 0;
RegWrite = 0;
MemRead = 0 ;
MemWrite = 0;
Branch = 1;
ALUOp1 = 0;
ALUop0 = 1;
end
endcase 
end 
endmodule 
