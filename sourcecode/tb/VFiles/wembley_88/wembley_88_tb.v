module wembley_88_tb;

    // Inputs
    reg [3:0] A_in;
    reg [3:0] B_in;
    reg [3:0] C_in;

    reg clk = 1'b1;    
    reg reset = 1;

    // Outputs
    wire [3:0] Y_out;



    wembley_88 UUT (.Ain(A_in), .Bin(B_in), .Cin(C_in), .clk(clk), .reset(reset), .Yout(Y_out));

    always #5 begin
        clk = ~clk; 
    end 

    initial begin
        reset = 0;

        #30
        
        A_in = 4'b0000;
        B_in = 4'b1111;
        C_in = 4'b1010;

        #30;

        $display("FIRST CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);

        if(Y_out != 1'b1) begin
            $display("Y_out is %d but should be 1'b1", Y_out);
        end


        A_in = 4'b1000;
        B_in = 4'b1111;
        C_in = 4'b1010;

        #30;

        $display("SECOND CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b0) begin
            $display("Y_out is %d but should be 1'b0", Y_out);
        end


        A_in = 4'b1001;
        B_in = 4'b1000;
        C_in = 4'b1010;

        #30;

        $display("THIRD CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b0) begin
            $display("Y_out is %d but should be 1'b0", Y_out);
        end


        A_in = 4'b0010;
        B_in = 4'b1011;
        C_in = 4'b1011;

        #30;

        $display("FOURTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b0) begin
            $display("Y_out is %d but should be 1'b0", Y_out);
        end


        A_in = 4'b1010;
        B_in = 4'b1111;
        C_in = 4'b1111;

        #30;

        $display("FIFTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b0) begin
            $display("Y_out is %d but should be 1'b0", Y_out);
        end


        A_in = 4'b0001;
        B_in = 4'b0011;
        C_in = 4'b1111;

        #30;

        $display("SIXTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b1) begin
            $display("Y_out is %d but should be 1'b1", Y_out);
        end


        A_in = 4'b1001;
        B_in = 4'b1011;
        C_in = 4'b1111;

        #30;

        $display("SEVENTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b0) begin
            $display("Y_out is %d but should be 1'b0", Y_out);
        end


        A_in = 4'b1101;
        B_in = 4'b0010;
        C_in = 4'b1010;

        #30;

        $display("EIGHTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b1) begin
            $display("Y_out is %d but should be 1'b1", Y_out);
        end


        A_in = 4'b0110;
        B_in = 4'b1011;
        C_in = 4'b0001;

        #30;

        $display("NINTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b1) begin
            $display("Y_out is %d but should be 1'b1", Y_out);
        end


        A_in = 4'b0110;
        B_in = 4'b1100;
        C_in = 4'b1001;

        #30;

        $display("TENTH CHECK");
        $display("A_in is %d", A_in);
        $display("B_in is %d", B_in);
        $display("C_in is %d", C_in);


    if(Y_out != 1'b0) begin
            $display("Y_out is %d but should be 1'b0", Y_out);
    end
    $finish;
    end
endmodule