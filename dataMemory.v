module DataMemory(input clk,input[63:0] address,input[63:0] data_in,input read,input write,output[63:0] data_out);
  	integer i;
	reg [7 : 0] Memory [0 : 511];

	initial begin
		for(i = 0; i < 511; i = i + 1)
			Memory[i] = 01;

	end

	assign data_out[7 : 0] = read ? Memory[address] : 8'bz; 
	assign data_out[15 : 8] = read ? Memory[address + 1] : 8'bz;
	assign data_out[23 : 16] = read ? Memory[address + 2] : 8'bz;
	assign data_out[31 : 24] = read ? Memory[address + 3] : 8'bz;
	assign data_out[39 : 32] = read ? Memory[address + 4] : 8'bz;
	assign data_out[47 : 40] = read ? Memory[address + 5] : 8'bz;
	assign data_out[55 : 48] = read ? Memory[address + 6] : 8'bz;
	assign data_out[63 : 56] = read ? Memory[address + 7] : 8'bz;
  
	always @(posedge clk) begin
		if(write)
		Memory[address] = data_in[7 : 0]; 
		Memory[address + 1] = data_in[15 : 8];
 		Memory[address + 2] = data_in[23 : 16];
      		Memory[address + 3] = data_in[31 : 24];
      		Memory[address + 4] = data_in[39 : 32];
      		Memory[address + 5] = data_in[47 : 40];
      		Memory[address + 6] = data_in[55 : 48];
      		Memory[address + 7] = data_in[63 : 56]; 
  	end

endmodule
