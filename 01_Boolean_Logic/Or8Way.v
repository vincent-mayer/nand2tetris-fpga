/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */

`default_nettype none
module Or8Way(
	input [7:0] in,
	output out
);

	wire or01;
	wire or012;
	wire or0123;
	wire or01234;
	wire or012345;
	wire or0123456;
	Or or0(.a(in[0]), .b(in[1]), .out(or01));
	Or or1(.a(or01), .b(in[2]), .out(or012));
	Or or2(.a(or012), .b(in[3]), .out(or0123));
	Or or3(.a(or0123), .b(in[4]), .out(or01234));
	Or or4(.a(or01234), .b(in[5]), .out(or012345));
	Or or5(.a(or012345), .b(in[6]), .out(or0123456));
	Or or6(.a(or0123456), .b(in[7]), .out(out));

endmodule
