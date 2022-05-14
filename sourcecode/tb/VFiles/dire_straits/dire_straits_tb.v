module dire_straits_tb;

// Inputs
reg [3:0] A_out;
reg [3:0] B_out;
reg [3:0] AND_out;

// Outputs
wire [3:0] A_e;
wire [3:0] B_e;
wire [3:0] C_e;


dire_straits UUT (.A_out(A_out), .B_out(B_out), .AND_out(AND_out), .A_e(A_e), .B_e(B_e), .C_e(C_e));

initial begin

// Cycle No. 1
    A_out = 4'b0000;
    B_out = 4'b1111;
    AND_out = 4'b1010;

    #10;

    $display("FIRST CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);

    if(A_e != 4'b1111) begin
        $display("A_e is %d but should be 4'b1111", A_e);
    end
    if(B_e != AND_out) begin 
        $display("B_e is %d but should be %d", B_e, AND_out);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end

    #10;

// Cycle No. 2
    A_out = 4'b0001;
    B_out = 4'b1111;
    AND_out = 4'b1010;

    #10;

    $display("SECOND CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b0000) begin
        $display("A_e is %d but should be 4'b0000", A_e);
    end
    if(B_e != 4'b0101) begin 
        $display("B_e is %d but should be 4'b0101", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;

// Cycle No. 3
    A_out = 4'b0101;
    B_out = 4'b1111;
    AND_out = 4'b1111;

    #10;

    $display("THIRD CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b0100) begin
        $display("A_e is %d but should be 4'b0100", A_e);
    end
    if(B_e != 4'b0000) begin 
        $display("B_e is %d but should be 4'b0000", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;

// Cycle No. 4
    A_out = 4'b0100;
    B_out = 4'b0001;
    AND_out = 4'b1010;

    #10;

    $display("FOURTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b0101) begin
        $display("A_e is %d but should be 4'b0101", A_e);
    end
    if(B_e != 4'b1010) begin 
        $display("B_e is %d but should be 4'b1010", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;

// Cycle No. 5
    A_out = 4'b0111;
    B_out = 4'b0001;
    AND_out = 4'b0000;

    #10;

    $display("FIFTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b1000) begin
        $display("A_e is %d but should be 4'b1000", A_e);
    end
    if(B_e != 4'b0000) begin 
        $display("B_e is %d but should be 4'b0000", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;
// Cycle No. 6
    A_out = 4'b1010;
    B_out = 4'b0111;
    AND_out = 4'b0000;

    #10;

    $display("SIXTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b0001) begin
        $display("A_e is %d but should be 4'b0001", A_e);
    end
    if(B_e != 4'b1111) begin 
        $display("B_e is %d but should be 4'1111", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end 

    #10;

// Cycle No. 7
    A_out = 4'b0110;
    B_out = 4'b1111;
    AND_out = 4'b1111;

    #10;

    $display("SEVENTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);

    if(A_e != 4'b0101) begin
        $display("A_e is %d but should be 4'b0101", A_e);
    end
    if(B_e != 4'b0000) begin 
        $display("B_e is %d but should be 4'0000", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end

    #10;

// Cycle No. 8
    A_out = 4'b1111;
    B_out = 4'b0000;
    AND_out = 4'b1110;

    #10;

    $display("EIGHTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b1111) begin
        $display("A_e is %d but should be 4'b1111", A_e);
    end
    if(B_e != 4'b1110) begin 
        $display("B_e is %d but should be 4'b1110", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;

// Cycle No. 9
    A_out = 4'b1001;
    B_out = 4'b1111;
    AND_out = 4'b0001;

    #10;

    $display("NINTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b1000) begin
        $display("A_e is %d but should be 4'b1000", A_e);
    end
    if(B_e != 4'b1110) begin 
        $display("B_e is %d but should be 4'b1110", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;

// Cycle No. 10
    A_out = 4'b1111;
    B_out = 4'b1111;
    AND_out = 4'b1100;

    #10;

    $display("TENTH CHECK");
    $display("A_out is %d", A_out);
    $display("B_out is %d", B_out);
    $display("AND_out is %d", AND_out);


    if(A_e != 4'b1110) begin
        $display("A_e is %d but should be 4'b1110", A_e);
    end
    if(B_e != 4'b0011) begin 
        $display("B_e is %d but should be 4'b0011", B_e);
    end
        if(C_e != (~AND_out)) begin 
        $display("C_e is %d but should be %d", C_e, (~AND_out));
    end  

    #10;


end
//$finish;
endmodule