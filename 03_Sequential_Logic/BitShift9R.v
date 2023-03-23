/**
* 10 bit Shiftregister (shifts to right)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]>>1 | (inMSB<<9)
* (shift one position to right and insert inMSB as most significant bit)
*/

`default_nettype none
module BitShift9R(
	input clk,
	input [8:0] in,
	input inMSB,
	input load,
	input shift,
	output [8:0] out
);

	wire b0;
	wire b1;
	wire b2;
	wire b3;
	wire b4;
	wire b5;
	wire b6;
	wire b7;
	wire b8;

	Mux mux0(.a(in[0]), .b(out[1]), .sel(shift), .out(b0));
	Mux mux1(.a(in[1]), .b(out[2]), .sel(shift), .out(b1));
	Mux mux2(.a(in[2]), .b(out[3]), .sel(shift), .out(b2));
	Mux mux3(.a(in[3]), .b(out[4]), .sel(shift), .out(b3));
	Mux mux4(.a(in[4]), .b(out[5]), .sel(shift), .out(b4));
	Mux mux5(.a(in[5]), .b(out[6]), .sel(shift), .out(b5));
	Mux mux6(.a(in[6]), .b(out[7]), .sel(shift), .out(b6));
	Mux mux7(.a(in[7]), .b(out[8]), .sel(shift), .out(b7));
	Mux mux8(.a(in[8]), .b(inMSB), .sel(shift), .out(b8));

	Bit bit00(.clk(clk), .in(b0), .load(load | shift), .out(out[0]));
	Bit bit01(.clk(clk), .in(b1), .load(load | shift), .out(out[1]));
	Bit bit02(.clk(clk), .in(b2), .load(load | shift), .out(out[2]));
	Bit bit03(.clk(clk), .in(b3), .load(load | shift), .out(out[3]));
	Bit bit04(.clk(clk), .in(b4), .load(load | shift), .out(out[4]));
	Bit bit05(.clk(clk), .in(b5), .load(load | shift), .out(out[5]));
	Bit bit06(.clk(clk), .in(b6), .load(load | shift), .out(out[6]));
	Bit bit07(.clk(clk), .in(b7), .load(load | shift), .out(out[7]));
	Bit bit08(.clk(clk), .in(b8), .load(load | shift), .out(out[8]));


endmodule
