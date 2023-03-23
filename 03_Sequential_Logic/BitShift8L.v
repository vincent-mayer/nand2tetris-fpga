/**
* 8-bit Shiftregister (shifts to left)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]<<1 | inLSB
* (shift one position to left and insert inLSB as least significant bit)
*/

`default_nettype none
module BitShift8L(
	input clk,
	input [7:0] in,
	input inLSB,
	input load,
	input shift,
	output [7:0] out
);
	wire b0;
	wire b1;
	wire b2;
	wire b3;
	wire b4;
	wire b5;
	wire b6;
	wire b7;

	Mux mux0(.a(in[0]), .b(inLSB), .sel(shift), .out(b0));
	Mux mux1(.a(in[1]), .b(out[0]), .sel(shift), .out(b1));
	Mux mux2(.a(in[2]), .b(out[1]), .sel(shift), .out(b2));
	Mux mux3(.a(in[3]), .b(out[2]), .sel(shift), .out(b3));
	Mux mux4(.a(in[4]), .b(out[3]), .sel(shift), .out(b4));
	Mux mux5(.a(in[5]), .b(out[4]), .sel(shift), .out(b5));
	Mux mux6(.a(in[6]), .b(out[5]), .sel(shift), .out(b6));
	Mux mux7(.a(in[7]), .b(out[6]), .sel(shift), .out(b7));

	Bit bit00(.clk(clk), .in(b0), .load(load | shift), .out(out[0]));
	Bit bit01(.clk(clk), .in(b1), .load(load | shift), .out(out[1]));
	Bit bit02(.clk(clk), .in(b2), .load(load | shift), .out(out[2]));
	Bit bit03(.clk(clk), .in(b3), .load(load | shift), .out(out[3]));
	Bit bit04(.clk(clk), .in(b4), .load(load | shift), .out(out[4]));
	Bit bit05(.clk(clk), .in(b5), .load(load | shift), .out(out[5]));
	Bit bit06(.clk(clk), .in(b6), .load(load | shift), .out(out[6]));
	Bit bit07(.clk(clk), .in(b7), .load(load | shift), .out(out[7]));

endmodule
