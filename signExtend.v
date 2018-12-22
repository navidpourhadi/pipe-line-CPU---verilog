module signExtend(input [31:0] dataIn , output [63:0] dataOut);
	assign dataOut = {{32{dataIn[31]}},dataIn[31:0]};
endmodule
