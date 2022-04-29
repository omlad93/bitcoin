`timescale 1ns/100ps

module reg4(

        input wire clk,
        input wire reset,
    	input wire [3:0] d, 
    	output reg [3:0] q);

    always @(posedge clk)
        begin
            if (reset)
                q = 0;
            else
                q = d;
        end







endmodule
