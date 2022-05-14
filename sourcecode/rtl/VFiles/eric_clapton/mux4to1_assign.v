`timescale 1ns/100ps

module mux4to1_assign(f, a, sel);

	output f;
	input [3:0] a;
	input [1:0] sel;

	assign f = sel[1] ? (sel[0] ? a[3] : a[2]) : (sel[0] ? a[1] : a[0]);

endmodule
