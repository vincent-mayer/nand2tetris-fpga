/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *    else out does not change (out[t+1] = out[t])
 */

`default_nettype none
module Bit(
	input clk,
	input in,
	input load,
	output out
);
	wire muxout;
	wire prevout;

	Mux mux0(.a(prevout), .b(in), .sel(load), .out(muxout));
	DFF dff(.clk(clk), .in(muxout), .out(out));
	Buffer buf0(.in(out), .out(prevout));

endmodule
