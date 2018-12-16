module CPU();
	wire [4:0] a , b , c;
	wire [63:0] dataA,dataB,dataC,bpc,apc;
	wire clk,w;
	wire reset,wpc;
	os os0(clk);
	testbench testbench0(a,b,c,w,clk,dataC);
	regBank32x64 regBank0(a,b,c,w,dataA,dataB,dataC,clk);
	adder adder0(apc);
	pc pc0(clk,bpc,wpc,reset);
endmodule