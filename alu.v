module ALU(input[63:0] data1 , data2 ,input[3:0] ALU_select ,output[63:0] result ,output z);
	reg [64:0] temp;
	reg temp2=0;
	always @(*)
	begin
		case(ALU_select)
		4'b0000: temp = data1 & data2;
		4'b0001: temp = data1 | data2;
		4'b0010: temp = data1 + data2;
		//4'b0011:
		//4'b0100:
		//4'b0101:
		4'b0110: temp = data1 - data2;
		4'b0111: temp = data2;
		//4'b1000:
		//4'b1001:
		//4'b1010:
		//4'b1011:
		4'b1100: temp = ~(data1 | data2);
		//4'b1101:
		//4'b1110:
		//4'b1111:
		endcase
		if(temp[63:0]==0) temp2=1;
	end
	assign result = temp[63:0];
	assign c = temp[64];
	assign z = temp2;
endmodule
