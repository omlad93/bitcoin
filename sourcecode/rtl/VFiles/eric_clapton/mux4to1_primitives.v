`timescale 1ns/100ps

module mux4to1_primitives(f, a, sel);

	output f;
	input [3:0] a;
	input [1:0] sel;
	wire sel0_not, sel1_not, t0, t1, t2 ,t3;

	not(sel0_not , sel[0]), (sel1_not, sel[1]);
	and (t0, sel[0], sel[1], a[3]) , (t1, sel[1], sel0_not, a[2]) , (t2, sel1_not, sel[0], a[1]) , (t3, sel1_not, sel0_not, a[0]);
	or (f, t0, t1, t2, t3);

endmodule
