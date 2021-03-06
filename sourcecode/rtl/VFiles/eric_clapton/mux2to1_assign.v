`timescale 1ns/100ps

module mux2to1_assign(f ,a, sel);

	output f;
	input [1:0] a;
	input sel;

	assign f = (sel)? a[1] : a[0];

endmodule