/**
* Uses CLK of 100MHz to generate:
* internal clock signal clk with 25MHz and
* a reset signal of approx. 20us length
*/
`default_nettype none
module Clock25_Reset20( 
    input CLK,			// external clock 100 MHz	
	output clk,			// internal clock 25 Mhz
	output reset 		// reset signal approx. 20us
);
	wire [15:0] outCnt;
	wire clkHigh;
	wire resetCnt;
	PC counter(.clk(CLK), .in(16'b0), .load(1'b0), .inc(1'b1), .reset(1'b0), .out(outCnt));
	Mux mux(.a(1'b0), .b(1'b1), .sel(outCnt[1]), .out(clk));
	Buffer buf1(.in(~outCnt[11]), .out(reset));

endmodule
