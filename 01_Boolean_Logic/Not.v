/**
 * Not gate:
 * out = not in
 */

`default_nettype none
module Not(
	input in,
	output out
);
	nand(out,in,in);

	// Put your code here:

endmodule
