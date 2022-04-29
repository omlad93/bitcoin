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

	A_read = 0000;
	B_read = 0000;
	C_read = 0000;
	Yout_read = 0;
	clk    = 1;
	reset  = 0;
	#10
	$finish;
end
endmodule
