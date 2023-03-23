/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux16(
	input [15:0] a,
	input [15:0] b,
   	input sel,
	output [15:0] out
);
	Mux mux0(.a(a[0]), .b(b[0]), .sel(sel), .out(out[0]));
	Mux mux1(.a(a[1]), .b(b[1]), .sel(sel), .out(out[1]));
	Mux mux2(.a(a[2]), .b(b[2]), .sel(sel), .out(out[2]));
	Mux mux3(.a(a[3]), .b(b[3]), .sel(sel), .out(out[3]));
	Mux mux4(.a(a[4]), .b(b[4]), .sel(sel), .out(out[4]));
	Mux mux5(.a(a[5]), .b(b[5]), .sel(sel), .out(out[5]));
	Mux mux6(.a(a[6]), .b(b[6]), .sel(sel), .out(out[6]));
	Mux mux7(.a(a[7]), .b(b[7]), .sel(sel), .out(out[7]));
	Mux mux8(.a(a[8]), .b(b[8]), .sel(sel), .out(out[8]));
	Mux mux9(.a(a[9]), .b(b[9]), .sel(sel), .out(out[9]));
	Mux mux10(.a(a[10]), .b(b[10]), .sel(sel), .out(out[10]));
	Mux mux11(.a(a[11]), .b(b[11]), .sel(sel), .out(out[11]));
	Mux mux12(.a(a[12]), .b(b[12]), .sel(sel), .out(out[12]));
	Mux mux13(.a(a[13]), .b(b[13]), .sel(sel), .out(out[13]));
	Mux mux14(.a(a[14]), .b(b[14]), .sel(sel), .out(out[14]));
	Mux mux15(.a(a[15]), .b(b[15]), .sel(sel), .out(out[15]));
	// Put your code here:

endmodule
