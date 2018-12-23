module AluControl (ALUOp0,ALUOp1, instruction, ALUControl);
input  ALUOp0,ALUOp1;
input [10:0] instruction;
output reg [3:0] ALUControl;

always@(*) begin 
if (ALUOp0==0&&ALUOp1==0) ALUControl=4'b0010;
else if (ALUOp0==1) ALUControl=4'b0111;
else if (ALUOp1==1)
case(instruction)
'b10001011000: ALUControl <= 'b 0010;
'b11001011000 : ALUControl <='b0110;
'b10001010000: ALUControl <= 'b 0000;
'b10101010000: ALUControl <= 'b 0001;
endcase  
end 
endmodule 