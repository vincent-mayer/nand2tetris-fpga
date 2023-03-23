/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

`default_nettype none
module DMux(
	input in,
	input sel,
    output a,
	output b
);
	wire notSel;
	Not not0(.in(sel), .out(notSel));
	And and0(.a(in), .b(notSel), .out(a));
	And and1(.a(in), .b(sel), .out(b));

endmodule
