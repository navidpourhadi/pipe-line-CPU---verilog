module testbench(a,b,c,w,clk,dataC);
	output reg [4:0] a,b,c;
	output reg w ;
	output reg [63:0] dataC;
	input clk;

	initial begin
		w = 0;
		a = 5'd0;
		b = 5'd1;
		c = 5'd2;
		dataC = 64'd0;
	end
	always @(posedge clk)
	begin

		w = ~w;
		dataC = dataC + 64'd32;
		a = a + 5'b00001;
		b = b + 5'b00001;
		c = c + 5'b00001;

	end
endmodule
