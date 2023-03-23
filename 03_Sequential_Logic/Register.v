/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

`default_nettype none

module Register(
	input clk,
	input [15:0] in,
	input load,
	output [15:0] out
);

	Bit bit0(.clk(clk), .in(in[0]), .load(load), .out(out[0]));
	Bit bit1(.clk(clk), .in(in[1]), .load(load), .out(out[1]));
	Bit bit2(.clk(clk), .in(in[2]), .load(load), .out(out[2]));
	Bit bit3(.clk(clk), .in(in[3]), .load(load), .out(out[3]));
	Bit bit4(.clk(clk), .in(in[4]), .load(load), .out(out[4]));
	Bit bit5(.clk(clk), .in(in[5]), .load(load), .out(out[5]));
	Bit bit6(.clk(clk), .in(in[6]), .load(load), .out(out[6]));
	Bit bit7(.clk(clk), .in(in[7]), .load(load), .out(out[7]));
	Bit bit8(.clk(clk), .in(in[8]), .load(load), .out(out[8]));
	Bit bit9(.clk(clk), .in(in[9]), .load(load), .out(out[9]));
	Bit bit10(.clk(clk), .in(in[10]), .load(load), .out(out[10]));
	Bit bit11(.clk(clk), .in(in[11]), .load(load), .out(out[11]));
	Bit bit12(.clk(clk), .in(in[12]), .load(load), .out(out[12]));
	Bit bit13(.clk(clk), .in(in[13]), .load(load), .out(out[13]));
	Bit bit14(.clk(clk), .in(in[14]), .load(load), .out(out[14]));
	Bit bit15(.clk(clk), .in(in[15]), .load(load), .out(out[15]));

endmodule
