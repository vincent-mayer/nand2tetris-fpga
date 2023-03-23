/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

`default_nettype none
module PC(
	input clk,
	input [15:0] in,
	input load,
	input inc,
	input reset,
	output [15:0] out
);	
	wire [15:0] oo;
	wire [15:0] incd;
	wire [15:0] o;
	wire [15:0] uu;
	wire [15:0] this;

	Inc16 inc0(.in(oo),.out(incd));
	Mux16 mux0(.a(oo),.b(incd),.sel(inc),.out(o));
	Mux16 mux1(.a(o),.b(in),.sel(load),.out(uu));
	Mux16 mux2(.a(uu),.b(16'b0),.sel(reset),.out(this));
	Register reg0(.clk(clk),.in(this),.load(1'b1),.out(out));
	Buffer16 buf0(.in(out), .out(oo));

endmodule
