module pc #(parameter n = 64 , delay = 0) (input clk,[n-1:0] bpc,input wpc,input reset,output reg [n-1:0] apc);
	
  	always @(posedge clk) begin
    		if (reset) begin
      		#delay	apc = 0;
      		end
    		else if(wpc)
	 	#delay	apc = bpc;
  	end
endmodule
