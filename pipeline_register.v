module pipeline_register #(parameter size=64)(input[size-1 : 0]indata , input clk , output reg [size-1 : 0]outdata);
	always @(posedge clk)begin
		//if(reset)
		//	outdata = {n{1'bz}};
		//else
			outdata = indata;
	end
	
endmodule
