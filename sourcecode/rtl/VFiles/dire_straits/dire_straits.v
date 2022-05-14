module dire_straits(
    input wire [3:0] A_out, B_out, AND_out,
    output wire [3:0] A_e, B_e, C_e
);

wire [4:0] s;

assign s = A_out + B_out;
assign A_e = s[3:0];
assign B_e[0] = s[4] ^ AND_out[0];
assign B_e[1] = s[4] ^ AND_out[1];
assign B_e[2] = s[4] ^ AND_out[2];
assign B_e[3] = s[4] ^ AND_out[3];
assign C_e = ~AND_out;

endmodule

