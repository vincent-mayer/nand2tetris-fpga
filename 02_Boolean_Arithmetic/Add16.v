/**
 * Adds two 16-bit values.
 * The most significant carry bit is ignored.
 * out = a + b (16 bit)
 */

`default_nettype none
module Add16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);

	wire c0;
	wire c1;
	wire c2;
	wire c3;
	wire c4;
	wire c5;
	wire c6;
	wire c7;
	wire c8;
	wire c9;
	wire c10;
	wire c11;
	wire c12;
	wire c13;
	wire c14;
	wire c15;

	FullAdder adder0(.a(a[0]), .b(b[0]), .c(1'b0), .sum(out[0]), .carry(c0));
	FullAdder adder1(.a(a[1]), .b(b[1]), .c(c0), .sum(out[1]), .carry(c1));
	FullAdder adder2(.a(a[2]), .b(b[2]), .c(c1), .sum(out[2]), .carry(c2));
	FullAdder adder3(.a(a[3]), .b(b[3]), .c(c2), .sum(out[3]), .carry(c3));
	FullAdder adder4(.a(a[4]), .b(b[4]), .c(c3), .sum(out[4]), .carry(c4));
	FullAdder adder5(.a(a[5]), .b(b[5]), .c(c4), .sum(out[5]), .carry(c5));
	FullAdder adder6(.a(a[6]), .b(b[6]), .c(c5), .sum(out[6]), .carry(c6));
	FullAdder adder7(.a(a[7]), .b(b[7]), .c(c6), .sum(out[7]), .carry(c7));
	FullAdder adder8(.a(a[8]), .b(b[8]), .c(c7), .sum(out[8]), .carry(c8));
	FullAdder adder9(.a(a[9]), .b(b[9]), .c(c8), .sum(out[9]), .carry(c9));
	FullAdder adder10(.a(a[10]), .b(b[10]), .c(c9), .sum(out[10]), .carry(c10));
	FullAdder adder11(.a(a[11]), .b(b[11]), .c(c10), .sum(out[11]), .carry(c11));
	FullAdder adder12(.a(a[12]), .b(b[12]), .c(c11), .sum(out[12]), .carry(c12));
	FullAdder adder13(.a(a[13]), .b(b[13]), .c(c12), .sum(out[13]), .carry(c13));
	FullAdder adder14(.a(a[14]), .b(b[14]), .c(c13), .sum(out[14]), .carry(c14));
	FullAdder adder15(.a(a[15]), .b(b[15]), .c(c14), .sum(out[15]), .carry(c15));

endmodule
