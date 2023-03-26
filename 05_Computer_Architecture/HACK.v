/**
 * The HACK computer, including CPU, ROM, RAM and the generator for
 * reset and clk (25MHz) signal. For approx. 20us HACK CPU resets.
 * From this point onward the user is at the mercy of the software.
 * In particular, depending on the program's code, the LED may show
 * some output and the user may be able to interact with the computer
 * via the BUT.
 */

`default_nettype none
module HACK( 
    input CLK,			// external clock 100 MHz	
	input [1:0] BUT,	// user button (0 if pressed, 1 if released)
	output [1:0] LED	// leds (0 off, 1 on)
);
	wire [15:0] instruction;
	wire clk;
	wire reset;
	wire [15:0] outM;
	wire writeM;
	wire [15:0] addressM;
	wire [15:0] pc;
	wire [15:0] memOut;

	wire loadRAM;
	wire loadIO0;
	wire loadIO1;
	wire loadIO2;
	wire loadIO3;
	wire loadIO4;
	wire loadIO5;
	wire loadIO6;
	wire loadIO7;
	wire loadIO8;
	wire loadIO9;
	wire loadIOA;
	wire loadIOB;
	wire loadIOC;
	wire loadIOD;
	wire loadIOE;
	wire loadIOF;

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

	// Clock:
	Clock25_Reset20 clock(.CLK(CLK), .clk(clk), .reset(reset));
	
	// CPU
	CPU cpu(.clk(clk),
			.inM(memOut),
			.instruction(instruction),
			.reset(reset),
			.outM(outM),
			.writeM(writeM),
			.addressM(addressM),
			.pc(pc));
	
	// ROM
	ROM rom(.pc(pc), .instruction(instruction));
	
	// RAM
	Memory memory(.address(addressM),
				  .load(writeM),
				  .out(memOut),
				  //
				  .loadRAM(loadRAM),
				  .inRAM(outRAM),
				  .loadIO0(loadIO0),
				  .inIO0(outIO0),
				  .loadIO1(loadIO1),
				  .inIO1(outIO1),
				  .loadIO2(loadIO2),
				  .inIO2(outIO2),
				  .loadIO3(loadIO3),
				  .inIO3(outIO3),
				  .loadIO4(loadIO4),
				  .inIO4(outIO4),
				  .loadIO5(loadIO5),
				  .inIO5(outIO5),
				  .loadIO6(loadIO6),
				  .inIO6(outIO6),
				  .loadIO7(loadIO7),
				  .inIO7(outIO7),
				  .loadIO8(loadIO8),
				  .inIO8(outIO8),
				  .loadIO9(loadIO9),
				  .inIO9(outIO9),
				  .loadIOA(loadIOA),
				  .inIOA(outIOA),
				  .loadIOB(loadIOB),
				  .inIOB(outIOB),
				  .loadIOC(loadIOC),
				  .inIOC(outIOC),
				  .loadIOD(loadIOD),
				  .inIOD(outIOD),
				  .loadIOE(loadIOE),
				  .inIOE(outIOE),
				  .loadIOF(loadIOF),
				  .inIOF(outIOF));

	RAM3840 ram0(.clk(clk), .address(addressM[11:0]), .in(outM), .load(loadRAM), .out(outRAM));
	Register regled(.clk(clk), .in(outM), .load(loadIO0), .out(outIO0)); // 1 0000 15 3210 LED
	Register regbut(.clk(clk), .in(BUT), .load(1'b1), .out(outIO1)); // 1 0001 BUT
	Register reg2(.clk(clk), .in(outM), .load(loadIO2), .out(outIO2)); // 1 0010
	Register reg3(.clk(clk), .in(outM), .load(loadIO3), .out(outIO3)); // 1 0011
	Register reg4(.clk(clk), .in(outM), .load(loadIO4), .out(outIO4)); // 1 0100
	Register reg5(.clk(clk), .in(outM), .load(loadIO5), .out(outIO5)); // 1 0101
	Register reg6(.clk(clk), .in(outM), .load(loadIO6), .out(outIO6)); // 1 0110
	Register reg7(.clk(clk), .in(outM), .load(loadIO7), .out(outIO7)); // 1 0111
	Register reg8(.clk(clk), .in(outM), .load(loadIO8), .out(outIO8)); // 1 1000
	Register reg9(.clk(clk), .in(outM), .load(loadIO9), .out(outIO9)); // 1 1001
	Register regA(.clk(clk), .in(outM), .load(loadIOA), .out(outIOA)); // 1 1010
	Register regB(.clk(clk), .in(outM), .load(loadIOB), .out(outIOB)); // 1 1011
	Register regC(.clk(clk), .in(outM), .load(loadIOC), .out(outIOC)); // 1 1100
	Register regD(.clk(clk), .in(outM), .load(loadIOD), .out(outIOD)); // 1 1101
	Register regE(.clk(clk), .in(outM), .load(loadIOE), .out(outIOE)); // 1 1110
	Register regF(.clk(clk), .in(outM), .load(loadIOF), .out(outIOF)); // 1 1111

	Buffer buf0(.in(outIO0[0]), .out(LED[0]));
	Buffer buf1(.in(outIO0[1]), .out(LED[1]));

endmodule
