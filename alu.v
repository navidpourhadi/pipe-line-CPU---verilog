module ALU#(parameter delay=0)(input[63:0] data1 , data2 ,input[3:0] ALU_select ,output[63:0] result ,output z);
	reg [64:0] temp;
	reg temp2=0;
	always @(*)
	begin
		case(ALU_select)
		4'b0000: #delay temp = data1 & data2;
		4'b0001: #delay temp = data1 | data2;
		4'b0010: #delay temp = data1 + data2;
		4'b0011: #delay temp = data1 * data2;
		4'b0100: #delay temp = data1 / data2;
		4'b0101: #delay temp = data1 ^ data2;
		4'b0110: #delay temp = data1 - data2;
		4'b0111: #delay temp = data2;
		4'b1000: #delay temp = data1 << 1;
		4'b1001: #delay temp = data2 >> 1;
		//4'b1010:
		//4'b1011:
		4'b1100: #delay temp = ~(data1 | data2);
		4'b1101: #delay temp = ~(data1 & data2);
		4'b1110: #delay temp = ~(data1 ^ data2);
		//4'b1111:
		endcase
		if(temp[63:0]==0) temp2=1;
	end
	assign result = temp[63:0];
	//assign c = temp[64];
	assign z = temp2;
endmodule
