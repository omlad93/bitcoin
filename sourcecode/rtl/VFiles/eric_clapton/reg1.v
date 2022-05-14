`timescale 1ns/100ps

module reg1(

        input wire clk,
        input wire reset,
    	input wire d, 
    	output reg q);

	always @(posedge clk or negedge reset)
		if (~reset) begin
			q <= d;
		end
		else begin
			q <= 1'b0;
		end


endmodule