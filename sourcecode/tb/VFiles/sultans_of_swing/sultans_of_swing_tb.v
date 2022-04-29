
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

    // our clock period
    // this is just an example for a period, insignificant at the moment.
	always #1 clk = ~clk; 
    always @(posedge clk) begin : expected
        if (reset) begin
            A_e <= 4'b0; 
            B_e <= 4'b0; 
            AND_e <= 4'b0; 
        end else begin
            A_e <= A_in;
            B_e <= B_in;
            AND_e <= (A_in ^ B_in) & (C_in);
        end
        $display("| $time | A   out |   %b   |   %b   |  %b  |",A_e,A_out,A_e==A_out);
        $display("| $time | B   out |   %b   |   %b   |  %b  |",B_e,B_out, B_e==B_out);
        $display("| $time | AND out |   %b   |   %b   |  %b  |",AND_e,AND_out, AND_e==AND_out);

    end

    initial begin
        $display("| Time |  Signal  | Expected | Computed | V |");
        A_in    = 4'b1111;
        B_in    = 4'b1111;
        C_in    = 4'b1111;
        reset   = 1'b1;
        #2
        reset = 1'b0;
        #2.5

        A_in    = 4'b0000;
        B_in    = 4'b0000;
        C_in    = 4'b0000;
        #5.5

        A_in    = 4'b0011;
        B_in    = 4'b0110;
        C_in    = 4'b0001;

        A_in    = 4'b1111;
        B_in    = 4'b0000;
        C_in    = 4'b0110;
        #5.5
        reset = 1'b1;

        /////////////

        $finish;
    end

    
    



endmodule
