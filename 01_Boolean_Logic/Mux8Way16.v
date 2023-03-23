/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux8Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
	input [15:0] e,
	input [15:0] f,
	input [15:0] g,
	input [15:0] h,
   	input [2:0] sel,
	output [15:0] out
);
	wire [15:0] abcd;
	wire [15:0] efgh;

	Mux4Way16 mux0(.a(a), .b(b), .c(c), .d(d), .sel(sel[1:0]), .out(abcd));
	Mux4Way16 mux1(.a(e), .b(f), .c(g), .d(h), .sel(sel[1:0]), .out(efgh));
	Mux16 mux2(.a(abcd), .b(efgh), .sel(sel[2]), .out(out));

endmodule
