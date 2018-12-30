module MUX#(parameter n=64)(input [n-1:0] data1 , data2 , input s , output [n-1:0] dataOut);
	assign dataOut = (s) ? data1 : data2;
endmodule
	