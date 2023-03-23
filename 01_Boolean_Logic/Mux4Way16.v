/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux4Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
   	input [1:0] sel,
	output [15:0] out
);
	wire [15:0] muxAB;
	wire [15:0] muxCD;

	Mux16 mux0(.a(a), .b(b), .sel(sel[0]), .out(muxAB));
	Mux16 mux1(.a(c), .b(d), .sel(sel[0]), .out(muxCD));
	Mux16 mux2(.a(muxAB), .b(muxCD), .sel(sel[1]), .out(out));

endmodule
