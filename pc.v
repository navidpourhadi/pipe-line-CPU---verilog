module pc (input clk,[63:0] bpc, wpc,reset,output reg [63:0] apc);
	
  	always @(posedge clk) begin
    		if (reset) begin
      			apc = 0;
      		end
    		else if(wpc)
	 		apc = bpc;
  	end
endmodule
