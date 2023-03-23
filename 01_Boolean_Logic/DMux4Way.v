/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

`default_nettype none
module DMux4Way(
	input in,
	input [1:0] sel,
    output a,
	output b,
	output c,
	output d
);
	wire w1;
	wire w2;

	DMux dmux0(.in(in), .sel(sel[1]), .a(w1), .b(w2));
	DMux dmux1(.in(w1), .sel(sel[0]), .a(a), .b(b));
	DMux dmux2(.in(w2), .sel(sel[0]), .a(c), .b(d));

endmodule
