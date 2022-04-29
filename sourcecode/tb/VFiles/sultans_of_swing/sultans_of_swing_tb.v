
module sultans_of_swing_tb;
//Inputs:   
    reg [3:0] A_in;
    reg [3:0] B_in;
    reg [3:0] C_in;

    reg clk = 1'b1;    
    reg reset;


    wire [3:0] A_out;      // Acual Result      
    wire [3:0] B_out;      // Acual Result 
    wire [3:0] AND_out;    // Acual Result  

    reg [3:0] A_e;        //Expected Result
    reg [3:0] B_e;        //Expected Result
    reg [3:0] AND_e;      //Expected Result

// our clock period
// this is just an example for a period, insignificant at the moment.
	always #5 clk = ~clk; 


// Expected Behavioural:
//      A_out[t]     =      A_in[t-1]
//      B_out[t]     =      B_in[t-1]
//      AND_out[t]   =      (A_in[t-1] ^ B_in[t-1]) & (C_in)
//      
//        

//Test-bench:
    sultans_of_swing UUT (
                            .Ai(A_in), 
                            .Bi(B_in),
                            .Ci(C_in),
                            .clk(clk),
                            .reset(reset),
                            .Ao(A_out),
                            .Bo(B_out),
                            .ANDo(AND_out)
    );


    initial begin

        A_in    = 4'b1111;
        B_in    = 4'b1111;
        C_in    = 4'b1111;
        reset   = 1'b1;
        #10
        reset = 1'b0;
        #10
        A_in    = 4'b0000;
        B_in    = 4'b0000;
        C_in    = 4'b0000;
        #10
        A_e     = 4'b0000;        //Expected Result
        B_e     = 4'b0000;        //Expected Result
        AND_e   = 4'b0000;      //Expected Result
        #10
        A_in    = 4'b0011;
        B_in    = 4'b0110;
        C_in    = 4'b0001;
        #10
        A_e     = 4'b0011;        //Expected Result
        B_e     = 4'b0110;        //Expected Result
        AND_e   = 4'b0001;      //Expected Result
        #10
        /////////////

        $finish;
    end
    

endmodule
