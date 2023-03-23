/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */

`default_nettype none
module Inc16(
	input [15:0] in,
	output [15:0] out
);
	Add16 add0(.a(in), .b(1), .out(out));
	
endmodule
