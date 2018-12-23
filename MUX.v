module MUX(input [63:0] data1 , data2 , input s , output [63:0] dataOut);
	assign dataOut = (s) ? data1 : data2;
endmodule
	