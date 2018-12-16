module regBank32x64(input [4:0] a ,input [4:0] b ,input [4:0] c ,input w ,output  [63:0] dataA ,output  [63:0] dataB ,input [63:0] dataC ,input clk);
	reg [63:0] regbank [0:31];

	assing	dataA = regbank[a];
	assing	dataB = regbank[b];

	always @(posedge clk) begin

		if (w==1) regbank[c] = dataC;
	end
endmodule
