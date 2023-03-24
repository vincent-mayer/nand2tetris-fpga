/**
 * The Hack CPU (Central Processing unit), consisting of an ALU,
 * two registers named A and D, and a program counter named PC.
 * The CPU is designed to fetch and execute instructions written in 
 * the Hack machine language. In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM==0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time step. If reset==1 then the 
 * CPU jumps to address 0 (i.e. pc is set to 0 in next time step) rather 
 * than to the address resulting from executing the current instruction. 
 */

`default_nettype none
module CPU(
		input clk,
    	input [15:0] inM,         	// M value input  (M = contents of RAM[A])
    	input [15:0] instruction, 	// Instruction for execution
		input reset,				// Signals whether to re-start the current
                         			// program (reset==1) or continue executing
                         			// the current program (reset==0).

    	output [15:0] outM,			// M value output
    	output writeM,				// Write to M? 
    	output [15:0] addressM,		// Address in data memory (of M) to read
    	output [15:0] pc			// address of next instruction
);
	wire Ainstruction;
	wire ALUtoA;
	wire [15:0] outFirstMux;
	wire loadA;
	wire [15:0] outA;
	wire loadD;
	wire [15:0] outD;
	wire [15:0] outSecondMux;
	wire [15:0] outM;
	wire [15:0] outAlu;
	wire outZr;
	wire outNg;
	wire writeM;
	wire jeq;
	wire jlt;
	wire NotoutZr;
	wire outPsZr;
	wire outPs;
	wire jgt;
	wire gtorlt;
	wire jumptemp;
	wire jump;
	wire Cinstruction;
	wire Cab;

	//              15  14 13  12   11 10 9  8  7  6     5  4  3    2  1  0
	// instruction: i   x  x   (a) (c1 c2 c3 c4 c5 c6)  (d1 d2 d3)  (j1 j2 j3)
	//          isCinst 
	// instruction[15]: isCinstruction
	And andc0(.a(instruction[15]), .b(instruction[14]), .out(Cab));
	And andc1(.a(Cab), .b(instruction[13]), .out(Cinstruction));


	// case 1, A instruction: following 0..14 bit are constant
	Not not0(.in(Cinstruction), .out(Ainstruction));
	// First mux, decides whether instruction is interpreted as data (A instruction)
	And and0(.a(Cinstruction), .b(instruction[5]), .out(ALUtoA));    // C-inst and dest to A-reg?
	Mux16 mux0(.a(instruction), .b(outAlu), .sel(ALUtoA), .out(outFirstMux));
	// A register
	Or or0(.a(Ainstruction), .b(ALUtoA), .out(loadA));
	Register regA(.clk(clk), .in(outFirstMux),  .load(loadA), .out(outA));
	//, out[0..14]=addressM
	Buffer16 bufff(.in(outA), .out(addressM));

	// D register
	And and1(.a(Cinstruction), .b(instruction[4]), .out(loadD));
	Register regD(.clk(clk), .in(outAlu), .load(loadD), .out(outD));
	// Second mux
	Mux16 mux1(.a(outA), .b(inM), .sel(instruction[12]), .out(outSecondMux));
	// ALU
	ALU alu0(.x(outD), .y(outSecondMux),
		.zx(instruction[11]), .nx(instruction[10]), .zy(instruction[9]),
		.ny(instruction[8]),  .f(instruction[7]),   .no(instruction[6]),
		.out(outM), .zr(outZr), .ng(outNg));
	Buffer16 buf15(.in(outM), .out(outAlu));

	// Write M?
	And and2(.a(instruction[3]), .b(Cinstruction), .out(writeM)); // Only write M if C instr

	// Program counter
	And and3(.a(outZr), .b(instruction[1]), .out(jeq)); // jump if j2 set and zero output
	And and4(.a(outNg), .b(instruction[2]), .out(jlt)); // jump if j1 set and negative output
	
	Not not1(.in(outZr), .out(NotoutZr));
	Not not2(.in(outNg), .out(outPsZr));
	And and5(.a(outPsZr), .b(NotoutZr), .out(outPs)); // Only positive if outNg = 0 and outZr = 0
	
	And and6(.a(outPs), .b(instruction[0]), .out(jgt)); // jump if j3 set and positive output
	Or or1(.a(jgt), .b(jlt), .out(gtorlt));
	Or or2(.a(gtorlt), .b(jeq), .out(jumptemp)); // If any one of the three conditions above are met, jump
	And and7(.a(jumptemp), .b(Cinstruction), .out(jump)); // Only jump if it is a Cinstruction
	// Load or reset PC?
	PC pc0(.clk(clk), .in(outA), .load(jump), .inc(1'b1), .reset(reset), .out(pc));

endmodule
