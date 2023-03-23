 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

`default_nettype none
module Or(
	input a,
	input b,
	output out
);
	wire w1;
	wire w2;

	Nand nand0(.a(a), .b(a), .out(w1));
	Nand nand1(.a(b), .b(b), .out(w2));
	Nand nand2(.a(w1), .b(w2), .out(out));

	// Put your code here:

endmodule
