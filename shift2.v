module shift2(input [63:0] data1 , output [63:0] data2);
	wire [1:0] a = 2'b00;
	assign data2 = {data1[63:0] , a};
endmodule
