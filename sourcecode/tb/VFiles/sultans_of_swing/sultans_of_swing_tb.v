
module sultans_of_swing_tb;
//Inputs:   
    reg [3:0] A_in;
    reg [3:0] B_in;
    reg [3:0] C_in;
    integer tick;
    reg clk = 1'b1;    
    reg reset;


    wire [3:0] A_out;      // Acual Result      
    wire [3:0] B_out;      // Acual Result 
    wire [3:0] AND_out;    // Acual Result  

    reg [3:0] A_e;        //Expected Result
    reg [3:0] B_e;        //Expected Result
    reg [3:0] AND_e;      //Expected Result


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
	always #1 begin
        clk = ~clk; 
        tick = (clk) ? tick + 1 : tick;
    end 

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
        if (tick > 0) begin
            $display("| %5d | A    out |   %b   |   %b   | %b |",tick,A_e,A_out,A_e==A_out);
            $display("| %5d | B    out |   %b   |   %b   | %b |",tick,B_e,B_out, B_e==B_out);
            $display("| %5d | AND  out |   %b   |   %b   | %b |",tick,AND_e,AND_out, AND_e==AND_out);
            $display("|-------|----------|----------|----------|---|");
            if ((A_e != A_out) | (B_e != B_out ) | (AND_e != AND_out)) begin
                 $display("\n\nERROR:");
                 $display("\tCanceled Simulation due to mismatch between expectation and actual result\n\n");
                 $finish;
            end
        end
    end

    initial begin       
        $display("\n\n TestBench for Sultan Of Swing:\n");
        $display("| Cycle |  Signal  | Expected | Computed | V |");
        $display("|-------|----------|----------|----------|---|");

        tick    = 0;
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
        #5.5

        A_in    = 4'b1011;
        B_in    = 4'b0111;
        C_in    = 4'b1100;
        #5.5

        A_in    = 4'b1001;
        B_in    = 4'b0111;
        C_in    = 4'b0000;
        #5.5
        
        A_in    = 4'b1111;
        B_in    = 4'b0000;
        C_in    = 4'b1111;
        #5.5

        A_in    = 4'b1111;
        B_in    = 4'b0000;
        C_in    = 4'b0110;
        #5.5
        reset = 1'b1;

        /////////////
        $display("\n\nSuccess:");
        $display("\tTestbench Finshed Successfully\n\n");
        $display("\n\n");
        $finish;
    end

    
    



endmodule
