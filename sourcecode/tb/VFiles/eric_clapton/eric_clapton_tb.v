`timescale 1ns / 1ps

module eric_clapton_tb;
//Inputs:   
    reg [3:0] A_read;
    reg [3:0] B_read;
    reg [3:0] C_read;

    reg clk = 1'b1;    
    reg reset;
    reg Yout_read; //Expected Result

//Outputs:
    wire w_Y; // de facto calculated 



//Test-bench:
	   

    eric_clapton UUT (.A_e(A_read), .B_e(B_read), .C_e(C_read), .clk(clk), .reset(reset), .Yout(w_Y));
//number of bits in each input and output according to the tabs.
//		4 		4 		4 	   1 		1 		1

// our clock period
// this is just an example for a period, insignificant at the moment.
	always #5 clk = ~clk; 

initial begin

	phase = 0;
	A_read = 0000;
	B_read = 0000;
	C_read = 0000;
	Yout_read = 0;
	clk    = 1;
	reset  = 1'b0;
	#10
	reset = 1'b0;
	#10

	for( i = 4'd0; i =< 4d'15; i = i + 4'd1) begin
		case (phase)
			2'b00: 
				A_read = i;
				if(A == 4d'15) begin
					phase = 1;
					A_read = 0000;
					i = 0;
					B_read = 0001;
				end

			2'b01:
				A_read = i;
				if (B_read == 4'd15) begin
					if(A == 4d'15) begin
						phase = 2;
						A_read = 0000;
						i = 0;
						B_read = 0000;
						C_read = 0001;
					end
				end else if(A == 4d'15) begin
					A_read = 0000;
					i = 0;
					B_read <= B_read + 1;
				end 
			2'b10: 
				A_read = i;
				if (C_read == 4'd15) begin 
					if (B_read == 4'd15) begin
						if(A == 4d'15) begin
							$finish;
						end
					end else if(A == 4d'15) begin
						A_read = 0000;
						i = 0;
						B_read <= B_read + 1;
					end
				end else if (B_read == 4'd15) begin
					i = 0;
					A_read = 0000;
					B_read = 0000;
					C_read <= C_read + 1; 
				end else if(A == 4d'15) begin
					A_read = 0000;
					i = 0;
					B_read <= B_read + 1;
				end
		endcase
	end
end
endmodule
