/**
 * The ALU (Arithmetic Logic Unit).
 * Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * In addition, the ALU computes two 1-bit outputs:
 * if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
 * if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.
 */

// Implementation: the ALU logic manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) set x = 0        // 16-bit constant
// if (nx == 1) set x = !x       // bitwise not
// if (zy == 1) set y = 0        // 16-bit constant
// if (ny == 1) set y = !y       // bitwise not
// if (f == 1)  set out = x + y  // integer 2's complement addition
// if (f == 0)  set out = x & y  // bitwise and
// if (no == 1) set out = !out   // bitwise not
// if (out == 0) set zr = 1
// if (out < 0) set ng = 1

`default_nettype none
module ALU(
	input [15:0] x,		// input x (16 bit)
	input [15:0] y,		// input y (16 bit)
    input zx, 				// zero the x input?
    input nx, 				// negate the x input?
    input zy, 				// zero the y input?
    input ny, 				// negate the y input?
    input f,  				// compute out = x + y (if 1) or x & y (if 0)
    input no, 				// negate the out output?
    output [15:0] out, 			// 16-bit output
    output zr, 				// 1 if (out == 0), 0 otherwise
    output ng 				// 1 if (out < 0),  0 otherwise
);

    wire [15:0] xzero;
    wire [15:0] xnegzero;
    wire [15:0] notxzero;
    wire [15:0] yzero;
    wire [15:0] ynegzero;
    wire [15:0] notyzero;
    wire [15:0] xandy;
    wire [15:0] xplusy;
    wire [15:0] xyafterf;
    wire [15:0] notxyafterf;
    wire notzero;
    wire t1;
    wire t2;
    wire [7:0] msb;
    wire [7:0] lsb;


    Mux16 mux0(.a(x), .b(0), .sel(zx), .out(xzero));
    Not16 not0(.in(xzero), .out(notxzero));
    Mux16 mux1(.a(xzero), .b(notxzero), .sel(nx), .out(xnegzero));

    // zy, ny
    Mux16 mux2(.a(y), .b(0), .sel(zy), .out(yzero));
    Not16 not1(.in(yzero), .out(notyzero));
    Mux16 mux3(.a(yzero), .b(notyzero), .sel(ny), .out(ynegzero));

    // f
    And16 and0(.a(xnegzero), .b(ynegzero), .out(xandy));
    Add16 add0(.a(xnegzero), .b(ynegzero), .out(xplusy));
    Mux16 mux4(.a(xandy), .b(xplusy), .sel(f), .out(xyafterf));

    // negate
    Not16 not2(.in(xyafterf), .out(notxyafterf));
    Mux16 mux5(.a(xyafterf), .b(notxyafterf), .sel(no), .out(out));

    // Buffers to split signals
    Buffer bufng(.in(out[15]), .out(ng));

    Buffer buf0(.in(out[0]), .out(lsb[0]));
    Buffer buf1(.in(out[1]), .out(lsb[1]));
    Buffer buf2(.in(out[2]), .out(lsb[2]));
    Buffer buf3(.in(out[3]), .out(lsb[3]));
    Buffer buf4(.in(out[4]), .out(lsb[4]));
    Buffer buf5(.in(out[5]), .out(lsb[5]));
    Buffer buf6(.in(out[6]), .out(lsb[6]));
    Buffer buf7(.in(out[7]), .out(lsb[7]));
    Buffer buf8(.in(out[8]), .out(msb[0]));
    Buffer buf9(.in(out[9]), .out(msb[1]));
    Buffer buf10(.in(out[10]), .out(msb[2]));
    Buffer buf11(.in(out[11]), .out(msb[3]));
    Buffer buf12(.in(out[12]), .out(msb[4]));
    Buffer buf13(.in(out[13]), .out(msb[5]));
    Buffer buf14(.in(out[14]), .out(msb[6]));
    Buffer buf15(.in(out[15]), .out(msb[7]));


    // zr
    Or8Way or0(.in(lsb), .out(t1));
    Or8Way or1(.in(msb), .out(t2));
    Or or2(.a(t1), .b(t2), .out(notzero));
    Not not3(.in(notzero), .out(zr));

endmodule
