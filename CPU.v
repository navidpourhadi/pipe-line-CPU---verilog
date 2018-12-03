module CPU();
	wire [4:0] a , b , c;
	wire [63:0] dataA,dataB,dataC;
	wire clk,w;
	os os0(clk);
	testbench testbench0(a,b,c,w,clk,dataC);
	regBank32x64 regBank0(a,b,c,w,dataA,dataB,dataC,clk);


endmodule