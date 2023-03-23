/**
 * 16-bit bitwise Buffer:
 * for i = 0..15: out[i] = in[i]
 */

`default_nettype none
module Buffer16(
	input [15:0] in,
	output [15:0] out
);
	assign out[15:0] = in[15:0];
	// Put your code here:

endmodule
