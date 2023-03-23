/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

`default_nettype none
module Mux(
	input a,
	input b,
	input sel,
	output out
);
	wire notSel;
	wire aAndNotSel;
	wire bAndSel;
	Not not0(.in(sel), .out(notSel));
	And and0(.a(a), .b(notSel), .out(aAndNotSel));
	And and1(.a(b), .b(sel), .out(bAndSel));
	Or or0(.a(aAndNotSel), .b(bAndSel), .out(out));
	// Put your code here:

endmodule
