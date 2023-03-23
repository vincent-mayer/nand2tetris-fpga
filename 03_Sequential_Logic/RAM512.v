/**
* RAM512 implements 512 Bytes of RAM addressed from 0 - 511
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module RAM512(
	input clk,
	input [8:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);
	wire load0;
	wire load1;
	wire [15:0] outram0;
	wire [15:0] outram1;
	DMux dmux0(.in(load), .sel(address[8]), .a(load0), .b(load1));
	RAM256 ram0(.clk(clk), .address(address[7:0]), .in(in), .load(load0), .out(outram0));
	RAM256 ram1(.clk(clk), .address(address[7:0]), .in(in), .load(load1), .out(outram1));
	Mux16 mux0(.a(outram0), .b(outram1), .sel(address[8]), .out(out));

endmodule
