/**
 * 16-bit bitwise And:
 * for i = 0..15: out[i] = (a[i] and b[i])
 */

`default_nettype none
module And16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);
	And and0(.a(a[0]), .b(b[0]), .out(out[0]));
	And and1(.a(a[1]), .b(b[1]), .out(out[1]));
	And and2(.a(a[2]), .b(b[2]), .out(out[2]));
	And and3(.a(a[3]), .b(b[3]), .out(out[3]));
	And and4(.a(a[4]), .b(b[4]), .out(out[4]));
	And and5(.a(a[5]), .b(b[5]), .out(out[5]));
	And and6(.a(a[6]), .b(b[6]), .out(out[6]));
	And and7(.a(a[7]), .b(b[7]), .out(out[7]));
	And and8(.a(a[8]), .b(b[8]), .out(out[8]));
	And and9(.a(a[9]), .b(b[9]), .out(out[9]));
	And and10(.a(a[10]), .b(b[10]), .out(out[10]));
	And and11(.a(a[11]), .b(b[11]), .out(out[11]));
	And and12(.a(a[12]), .b(b[12]), .out(out[12]));
	And and13(.a(a[13]), .b(b[13]), .out(out[13]));
	And and14(.a(a[14]), .b(b[14]), .out(out[14]));
	And and15(.a(a[15]), .b(b[15]), .out(out[15]));

endmodule
