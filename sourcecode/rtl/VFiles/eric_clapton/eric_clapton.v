`timescale 1ns/100ps

module eric_clapton(

    input wire [3:0] A_e, B_e, C_e,              
    input wire clk,
    input wire reset,
    output reg Yout);

	//interior wiring
    wire [3:0] regA_output;
    wire [3:0] regC_output;
    wire [1:0] t;
    wire [3:0] q;
    wire [1:0] q_Bar;
    wire mux_assign_out;
    wire [3:0] mux_assign_in;
    wire Yout_wire;
    
    assign q_Bar = ~(q[1:0]);
    assign mux_assign_in[3] = 1;
    assign mux_assign_in[2] = 0;
    assign mux_assign_in[1] = t[1];
    assign mux_assign_in[0] = t[0];

	//registers
    reg4 regA (.clk(clk), .reset(reset), .d(A_e), .q(regA_output));
    reg4 regB (.clk(clk), .reset(reset), .d(B_e), .q(q));
    reg4 regC (.clk(clk), .reset(reset), .d(C_e), .q(regC_output));
    reg1 reg_out (.clk(clk), .reset(reset), .d(mux_assign_out), .q(Yout_wire));

    //logic operations
    mux4to1_always mux4to1_always (.f(t[0]), .a(regA_output), .sel(q[1:0]));
    mux4to1_primitives mux4to1_primitives (.f(t[1]), .a(regC_output), .sel(q[3:2]));
    mux4to1_assign mux4to1_assign (.f(mux_assign_out), .a(mux_assign_in), .sel(q_Bar));

    always @(*) begin
        Yout = Yout_wire;
    end

endmodule
