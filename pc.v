module pc (input clk,[63:0] bpc, wpc,reset,output reg [63:0] apc);
  initial begin
  reset = 1;
  wpc = 1;
  end
  always @(posedge clk) begin
    if (reset) 
      begin
        apc = 0;
      end
    else if 
        apc = bpc;
  end
endmodule
