module pc(input reset,input write,input clk,input [63:0] pcPre,output reg [63:0] pcNext);

	always @(posedge clk)
		begin
			if(reset)
				begin
					pcNext=0;
					//reset=0;
				end
			else if(write)
				pcNext=pcPre;
			
		end
endmodule
