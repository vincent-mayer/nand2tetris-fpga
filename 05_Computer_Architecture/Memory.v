/**
 * The complete address space of the Hack computer's memory,
 * including RAM and memory-mapped I/O. 
 * The chip facilitates read and write operations, as follows:
 *     Read:  out(t) = Memory[address(t)](t)
 *     Write: if load(t-1) then Memory[address(t-1)](t) = in(t-1)
 * In words: the chip always outputs the value stored at the memory 
 * location specified by address. If load==1, the in value is loaded 
 * into the memory location specified by address. This value becomes 
 * available through the out output from the next time step onward.
 * Address space rules:
 * RAM 0x0000 - 0x0EFF (3840 words)
 * IO  0x1000 - 0x100F (maps to 16 different devices)
 * The behavior of IO addresses is described in 06_IO-Devices
 */

`default_nettype none
module Memory(
	input clk,
	input [15:0] address,
	input load,
	output [15:0] out,
	output loadRAM,
	output loadIO0,
	output loadIO1,
	output loadIO2,
	output loadIO3,
	output loadIO4,
	output loadIO5,
	output loadIO6,
	output loadIO7,
	output loadIO8,
	output loadIO9,
	output loadIOA,
	output loadIOB,
	output loadIOC,
	output loadIOD,
	output loadIOE,
	output loadIOF,
	input [15:0] inRAM,
	input [15:0] inIO0,
	input [15:0] inIO1,
	input [15:0] inIO2,
	input [15:0] inIO3,
	input [15:0] inIO4,
	input [15:0] inIO5,
	input [15:0] inIO6,
	input [15:0] inIO7,
	input [15:0] inIO8,
	input [15:0] inIO9,
	input [15:0] inIOA,
	input [15:0] inIOB,
	input [15:0] inIOC,
	input [15:0] inIOD,
	input [15:0] inIOE,
	input [15:0] inIOF
);

	// Put your code here:

	wire [15:0] outRAM;
	wire [15:0] outIO0;
	wire [15:0] outIO1;
	wire [15:0] outIO2;
	wire [15:0] outIO3;
	wire [15:0] outIO4;
	wire [15:0] outIO5;
	wire [15:0] outIO6;
	wire [15:0] outIO7;
	wire [15:0] outIO8;
	wire [15:0] outIO9;
	wire [15:0] outIOA;
	wire [15:0] outIOB;
	wire [15:0] outIOC;
	wire [15:0] outIOD;
	wire [15:0] outIOE;
	wire [15:0] outIOF;
	
	wire [15:0] outMux0;
	wire [15:0] outMux1;
	wire [15:0] outMuxPeri;

	wire ramaddr;

	// Is the addr a ram addr?
	assign ramaddr = ~address[15] & ~address[14] & ~address[13] & ~address[12];

	// Load
	assign loadRAM = (ramaddr & load);
	assign loadIO0 = (address[12] & ~address[3] & ~address[2] & ~address[1] & ~address[0] & load);
	assign loadIO1 = (address[12] & ~address[3] & ~address[2] & ~address[1] & address[0] & load);
	assign loadIO2 = (address[12] & ~address[3] & ~address[2] & address[1] & ~address[0] & load);
	assign loadIO3 = (address[12] & ~address[3] & ~address[2] & address[1] & address[0] & load);
	assign loadIO4 = (address[12] & ~address[3] & address[2] & ~address[1] & ~address[0] & load);
	assign loadIO5 = (address[12] & ~address[3] & address[2] & ~address[1] & address[0] & load);
	assign loadIO6 = (address[12] & ~address[3] & address[2] & address[1] & ~address[0] & load);
	assign loadIO7 = (address[12] & ~address[3] & address[2] & address[1] & address[0] & load);
	assign loadIO8 = (address[12] & address[3] & ~address[2] & ~address[1] & ~address[0] & load);
	assign loadIO9 = (address[12] & address[3] & ~address[2] & ~address[1] & address[0] & load);
	assign loadIOA = (address[12] & address[3] & ~address[2] & address[1] & ~address[0] & load);
	assign loadIOB = (address[12] & address[3] & ~address[2] & address[1] & address[0] & load);
	assign loadIOC = (address[12] & address[3] & address[2] & ~address[1] & ~address[0] & load);
	assign loadIOD = (address[12] & address[3] & address[2] & ~address[1] & address[0] & load);
	assign loadIOE = (address[12] & address[3] & address[2] & address[1] & ~address[0] & load);
	assign loadIOF = (address[12] & address[3] & address[2] & address[1] & address[0] & load);

	// Memory
	RAM3840 ram0(.clk(clk), .address(address[11:0]), .in(inRAM), .load(loadRAM), .out(outRAM));
	Register reg0(.clk(clk), .in(inIO0), .load(loadIO0), .out(outIO0)); // 1 0000 15 3210
	Register reg1(.clk(clk), .in(inIO1), .load(loadIO1), .out(outIO1)); // 1 0001
	Register reg2(.clk(clk), .in(inIO2), .load(loadIO2), .out(outIO2)); // 1 0010
	Register reg3(.clk(clk), .in(inIO3), .load(loadIO3), .out(outIO3)); // 1 0011
	Register reg4(.clk(clk), .in(inIO4), .load(loadIO4), .out(outIO4)); // 1 0100
	Register reg5(.clk(clk), .in(inIO5), .load(loadIO5), .out(outIO5)); // 1 0101
	Register reg6(.clk(clk), .in(inIO6), .load(loadIO6), .out(outIO6)); // 1 0110
	Register reg7(.clk(clk), .in(inIO7), .load(loadIO7), .out(outIO7)); // 1 0111
	Register reg8(.clk(clk), .in(inIO8), .load(loadIO8), .out(outIO8)); // 1 1000
	Register reg9(.clk(clk), .in(inIO9), .load(loadIO9), .out(outIO9)); // 1 1001
	Register regA(.clk(clk), .in(inIOA), .load(loadIOA), .out(outIOA)); // 1 1010
	Register regB(.clk(clk), .in(inIOB), .load(loadIOB), .out(outIOB)); // 1 1011
	Register regC(.clk(clk), .in(inIOC), .load(loadIOC), .out(outIOC)); // 1 1100
	Register regD(.clk(clk), .in(inIOD), .load(loadIOD), .out(outIOD)); // 1 1101
	Register regE(.clk(clk), .in(inIOE), .load(loadIOE), .out(outIOE)); // 1 1110
	Register regF(.clk(clk), .in(inIOF), .load(loadIOF), .out(outIOF)); // 1 1111
	
	// Output
	Mux8Way16 mux0(.a(outIO0),
				   .b(outIO1),
				   .c(outIO2),
				   .d(outIO3),
				   .e(outIO4),
				   .f(outIO5),
				   .g(outIO6),
				   .h(outIO7),
				   .sel(address[2:0]),
				   .out(outMux0)
	);	
	
	Mux8Way16 mux1(.a(outIO8),
				   .b(outIO9),
				   .c(outIOA),
				   .d(outIOB),
				   .e(outIOC),
				   .f(outIOD),
				   .g(outIOE),
				   .h(outIOF),
				   .sel(address[2:0]),
				   .out(outMux1)
	);

	Mux16 mux2(.a(outMux0), .b(outMux1), .sel(address[3]), .out(outMuxPeri));
	Mux16 mux3(.a(outMuxPeri), .b(outRAM), .sel(ramaddr), .out(out));

endmodule
