`timescale 1ns/100ps

module mux2to1_primitives(f ,a, sel);

	output f;
	input [1:0] a;
	input sel;
	wire t1, t2, sel2;

	not (sel2, sel);
	and (t1, a[0], sel2) , (t2, a[1], sel);
	or  (f, t1, t2);

endmodule
