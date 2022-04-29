`timescale 1ns/100ps

module mux2to1_always(f ,a, sel);

	output f;
	input [1:0] a;
	input sel;

	always @(a[0] or a[1] or sel)
	begin
		if(sel)
		f = a[1];
		else
		f = a[0];
	end











endmodule
