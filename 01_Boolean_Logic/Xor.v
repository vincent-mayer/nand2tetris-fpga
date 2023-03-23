/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

`default_nettype none
module Xor(
	input a,
	input b,
	output out
);
	wire notA;
	wire notB;
	wire aAndNotB;
	wire notAandB;
	Not not0(.in(a),.out(notA));
	Not not1(.in(b),.out(notB));
	And and0(.a(a),.b(notB),.out(aAndNotB));
	And and1(.a(notA),.b(b),.out(notAandB));
	Or or0(.a(aAndNotB),.b(notAandB),.out(out));
	// Put your code here:

endmodule
