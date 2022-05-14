`timescale 1ns/100ps

module sultans_of_swing(
    input wire [3:0] Ai, Bi, Ci,              
    input wire clk,
    input wire reset,
    output reg [3:0] Ao, Bo, ANDo
    );

    // Wire Declerations
    wire [3:0] regAo;
    wire [3:0] regBo;
    wire [3:0] regCo;
    wire [3:0] a_xor_b;

    
    // Registers
    reg4 regA (.clk(clk), .reset(reset), .d(Ai), .q(regAo));
    reg4 regB (.clk(clk), .reset(reset), .d(Bi), .q(regBo));
    reg4 regC (.clk(clk), .reset(reset), .d(Ci), .q(regCo));

    // Assignments (Logic)
    assign  a_xor_b = regAo ^ regBo;
    always @(*) begin
        ANDo = a_xor_b & regCo;    
        Ao = regAo;
        Bo = regBo;
    end
    



endmodule
