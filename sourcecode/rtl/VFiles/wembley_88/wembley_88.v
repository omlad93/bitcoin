`timescale 1ns/100ps

module wembley_88(
    input wire [3:0] Ain, Bin, Cin,              
    input wire clk,
    input wire reset,
    output wire Yout
    );

    // Wire Declerations
    wire [3:0] A_out;
    wire [3:0] B_out;
    wire [3:0] AND_out;
    wire [3:0] A_e;
    wire [3:0] B_e;
    wire [3:0] C_e;

    sultans_of_swing sultan(.Ai(Ain), .Bi(Bin), .Ci(Cin), .Ao(A_out), .clk(clk), .reset(reset), .Bo(B_out), .ANDo(AND_out));
    dire_straits dire(.A_out(A_out), .B_out(B_out), .AND_out(AND_out), .A_e(A_e), .B_e(B_e), .C_e(C_e));
    eric_clapton eric(.A_e(A_e), .B_e(B_e), .C_e(C_e), .clk(clk), .reset(reset), .Yout(Yout));



endmodule
