module os #(parameter delay=100)(output reg clock);

	initial begin
		clock = 0;
	end
	
	always
	begin
	#delay clock=1;
	#delay clock=0;
	end
endmodule
