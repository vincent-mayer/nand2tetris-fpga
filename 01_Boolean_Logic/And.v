/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

`default_nettype none
module And(
	input a,
	input b,
	output out
);
	wire w1;
	Nand nand0(.a(a), .b(b), .out(w1));
	Not not0(.in(w1), .out(out));
	// Put your code here:

endmodule
