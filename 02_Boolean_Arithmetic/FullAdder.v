/**
 * Computes the sum of three bits.
 */

`default_nettype none
module FullAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	input c,		//1-bit input
	output sum,		//Right bit of a + b + c
	output carry	//Left bit of a + b + c
);
	wire s1;
	wire c1;
	wire c2;

	HalfAdder add0(.a(a), .b(b), .sum(s1), .carry(c1));
	HalfAdder add1(.a(c), .b(s1), .sum(sum), .carry(c2));
	Or or0(.a(c1), .b(c2), .out(carry));

endmodule
