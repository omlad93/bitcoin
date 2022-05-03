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

end
//$finish;
endmodule