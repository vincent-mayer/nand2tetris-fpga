/**
* RAM3840 implements 3840 Bytes of RAM addressed from 0 - 3839
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
* 7 * 512 + 1 * 256
*/

`default_nettype none
module RAM3840(
	input clk,
	input [11:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);
	wire [15:0] outram0;
	wire [15:0] outram1;
	wire [15:0] outram2;
	wire [15:0] outram3;
	wire [15:0] outram4;
	wire [15:0] outram5;
	wire [15:0] outram6;
	wire [15:0] outram7;

	wire load0;
	wire load1;
	wire load2;
	wire load3;
	wire load4;
	wire load5;
	wire load6;
	wire load7;

	DMux8Way dmux0(.in(load), .sel(address[11:9]), .a(load0), .b(load1), .c(load2), .d(load3), .e(load4), .f(load5), .g(load6), .h(load7));
	RAM512 ram0(.clk(clk), .in(in), .load(load0), .address(address[8:0]), .out(outram0));
	RAM512 ram1(.clk(clk), .in(in), .load(load1), .address(address[8:0]), .out(outram1));
	RAM512 ram2(.clk(clk), .in(in), .load(load2), .address(address[8:0]), .out(outram2));
	RAM512 ram3(.clk(clk), .in(in), .load(load3), .address(address[8:0]), .out(outram3));
	RAM512 ram4(.clk(clk), .in(in), .load(load4), .address(address[8:0]), .out(outram4));
	RAM512 ram5(.clk(clk), .in(in), .load(load5), .address(address[8:0]), .out(outram5));
	RAM512 ram6(.clk(clk), .in(in), .load(load6), .address(address[8:0]), .out(outram6));
	RAM256 ram7(.clk(clk), .in(in), .load(load7), .address(address[7:0]), .out(outram7));
	Mux8Way16 mux0(.a(outram0), .b(outram1), .c(outram2), .d(outram3), .e(outram4), .f(outram5), .g(outram6), .h(outram7), .sel(address[11:9]), .out(out));

endmodule
