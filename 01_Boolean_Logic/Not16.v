/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */

`default_nettype none
module Not16(
	input [15:0] in,
	output [15:0] out
);
	Not not00(.in(in[0]), .out(out[0]));
	Not not01(.in(in[1]), .out(out[1]));
	Not not02(.in(in[2]), .out(out[2]));
	Not not03(.in(in[3]), .out(out[3]));
	Not not04(.in(in[4]), .out(out[4]));
	Not not05(.in(in[5]), .out(out[5]));
	Not not06(.in(in[6]), .out(out[6]));
	Not not07(.in(in[7]), .out(out[7]));
	Not not08(.in(in[8]), .out(out[8]));
	Not not09(.in(in[9]), .out(out[9]));
	Not not10(.in(in[10]), .out(out[10]));
	Not not11(.in(in[11]), .out(out[11]));
	Not not12(.in(in[12]), .out(out[12]));
	Not not13(.in(in[13]), .out(out[13]));
	Not not14(.in(in[14]), .out(out[14]));
	Not not15(.in(in[15]), .out(out[15]));	
	// Put your code here:

endmodule
