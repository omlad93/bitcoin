`timescale 1ns / 1ps

module eric_clapton_tb;
//Inputs:   
    reg [3:0] A_read;
    reg [3:0] B_read;
    reg [3:0] C_read;

    reg clk = 1'b1;    
    reg reset = 1;
    reg Yout_read = 1'b0; //Expected Result

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
		#10
		reset = 0;

		A_read = 4'b0000;
		B_read = 4'b0000;
		C_read = 4'b0000;
		
		Yout_read = 1;
		#10


		//test vector 1	
		A_read = 4'b0011;
		B_read = 4'b1101;
		C_read = 4'b0000;
		#10
		Yout_read = 0;
		


		//test vector 2
		A_read = 4'b1001;
		B_read = 4'b0011;
		C_read = 4'b0011;
		#10
		Yout_read = 1;
		

		//test vector 3
		A_read = 4'b1001;
		B_read = 4'b1110;
		C_read = 4'b0011;
		#10
		Yout_read = 0;


		//test vector 3.5
		A_read = 4'b1001;
		B_read = 4'b1111;
		C_read = 4'b1111;
		#10
		Yout_read = 1;

		
		//test vector 4
		A_read = 4'b1001;
		B_read = 4'b1111;
		C_read = 4'b1111;
		#10
		Yout_read = 0;

		reset = 1;
		//test vector 5
		A_read = 4'b1001;
		B_read = 4'b1111;
		C_read = 4'b1111;
		#10
		Yout_read = 1;
		
		reset = 0;
		//test vector 6
		A_read = 4'b1001;
		B_read = 4'b1111;
		C_read = 4'b1111;
		#10
		Yout_read = 1;


		//test vector 7
		A_read = 4'b0000;
		B_read = 4'b1111;
		C_read = 4'b0000;
		#10
		Yout_read = 0;


		//test vector 8
		A_read = 4'b0011;
		B_read = 4'b1001;
		C_read = 4'b0110;
		#10
		Yout_read = 0;


		//test vector 9
		A_read = 4'b1100;
		B_read = 4'b1000;
		C_read = 4'b0110;
		#10
		Yout_read = 1;
		

		//test vector 10
		A_read = 4'b0110;
		B_read = 4'b1111;
		C_read = 4'b1111;
		#10
		Yout_read = 0;
		#20

		
		

		$finish;
	end
endmodule

/*`timescale 1ns / 1ps

module eric_clapton_tb;
//Inputs:   
    reg [3:0] A_read;
    reg [3:0] B_read;
    reg [3:0] C_read;

    reg clk = 1'b1;  
	integer tick;
    reg reset = 1;
    
	wire Y_out; //Actual Result

	reg Yout_read;   //Expected Result

	reg [1:0] t;
	reg mux_assign_out;
	reg pre_Yout_read;
//Outputs:
//    wire w_Y; // de facto calculated 



//Test-bench:
	   

    eric_clapton UUT (.A_e(A_read), .B_e(B_read), .C_e(C_read), .clk(clk), .reset(reset), .Yout(Y_out));
//number of bits in each input and output according to the tabs.
//		4 		4 		4 	   1 		1 		1

// our clock period
// this is just an example for a period, insignificant at the moment.
	always #5 begin
		clk = ~clk; 
 		tick = (clk) ? tick + 1 : tick;
    end 

 always @(posedge clk) begin : expected
        if (reset) begin
			#10
			Yout_read <= 4'b0;
        end else begin
			#10
            case (B_read[1:0])
				2'b00: t[0] <= A_read[0];

				2'b01: t[0] <= A_read[1];

				2'b10: t[0] <= A_read[2];

				2'b11: t[0] <= A_read[3];
			endcase
			case (B_read[3:2])
				2'b00: t[1] <= C_read[0];

				2'b01: t[1] <= C_read[1];

				2'b10: t[1] <= C_read[2];

				2'b11: t[1] <= C_read[3];
			endcase
			case (~(B_read[1:0]))
				2'b00: Yout_read <= t[0];

				2'b01: Yout_read <= t[1];

				2'b10: Yout_read <= 1'b0;

				2'b11: Yout_read <= 1'b1;
			endcase
			#10
			Yout_read <= mux_assign_out;
        end
        if (tick > 0) begin
            $display("| %5d |  Y  out  |    %b     |    %b     | %b  |",tick,Yout_read,Y_out,Yout_read==Y_out);
            $display("|-------|----------|----------|----------|----|");
            if (Yout_read != Y_out) begin
                 $display("\n\nERROR:");
                 $display("\tCanceled Simulation due to mismatch between expectation and actual result\n\n");
                 $finish;
            end
        end
    end

    initial begin       
        $display("\n\n TestBench for Eric Clapton:\n");
        $display("| Cycle |  Signal  | Expected | Computed |  V |");
        $display("|-------|----------|----------|----------|----|");
		
		tick    = 0;
        A_read    = 4'b1111;
        B_read    = 4'b1111;
        C_read    = 4'b1111;
		#10
		reset = 1'b0;

		#10
        A_read    = 4'b0000;
        B_read    = 4'b0000;
        C_read    = 4'b0000;
        #10

        A_read    = 4'b0011;
        B_read    = 4'b0110;
        C_read    = 4'b0001;
        #10

        A_read    = 4'b1011;
        B_read    = 4'b0111;
        C_read    = 4'b1100;
        #10

        A_read    = 4'b1001;
        B_read    = 4'b0111;
        C_read    = 4'b0000;
        #10
        
        A_read    = 4'b1111;
        B_read    = 4'b0000;
        C_read    = 4'b1111;
        #10

        A_read    = 4'b1111;
        B_read    = 4'b0000;
        C_read    = 4'b0110;
        #10
        

        /////////////
        $display("\n\nSuccess:");
        $display("\tTestbench Finshed Successfully\n\n");
        $display("\n\n");
        $finish;
    end

    
    
*/
/*
	//integer phase = 0;
	//integer i;
	//A_read = 0000;
	//B_read = 0000;
	//C_read = 0000;
	//Yout_read = 0;
	clk    = 1;
	#20
	reset  = 1'b1;
	#10
	reset = 1'b0;
	#10

	#100 A_read=4'b0000; B_read=4'b0000; C_read=4'b0000;
	#200 A_read=4'b0100; B_read=4'b0011; C_read=4'b0101;
	#300 A_read=4'b0011; B_read=4'b0111; C_read=4'b1100;
	#400 A_read=4'b1000; B_read=4'b0100; C_read=4'b1011;
	#500 A_read=4'b0101; B_read=4'b0101; C_read=4'b1001;



	for( i = 4'b0000; i <= 4'b1111; i = i + 1'b1) begin
		case (phase)
			2'b00 : 
				if(A_read == 4'b1111) begin
					phase = 1;
					A_read = 0000;
					i = 0;
					B_read = 0001;
				end else begin
					A_read <= i;
				end
			2'b01:
				if (B_read == 4'b1111) begin
					if(A_read == 4'b1111) begin
						phase = 2;
						A_read = 0000;
						i = 0;
						B_read = 0000;
						C_read = 0001;
					end else begin
						A_read <= i;
					end
				end else if(A == 4'b1111) begin
					A_read = 0000;
					i = 0;
					B_read <= B_read + 1;
				end else begin
					A_read <= i;
				end
			2'b10: 
				if (C_read == 4'b1111) begin 
					if (B_read == 4'b1111) begin
						if(A == 4'b1111) begin
							$finish;
						end else begin
							A_read <= i;
						end
					end else if(A == 4'b1111) begin
						A_read = 0000;
						i = 0;
						B_read <= B_read + 1;
					end else begin
						A_read <= i;
					end
				end else if (B_read == 4'b1111) begin
					i = 0;
					A_read = 0000;
					B_read = 0000;
					C_read <= C_read + 1; 
				end else if(A == 4'b1111) begin
					A_read = 0000;
					i = 0;
					B_read <= B_read + 1;
				end else begin
					A_read <= i;
				end
		endcase
	end */


