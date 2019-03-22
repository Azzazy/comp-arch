module CSA(input [7:0] A, input [7:0] B, output [7:0] out, output carry_out);
    wire rca_a_carry, rca_b_0_carry, rca_b_1_carry;
    wire [3:0] rca_b_0_out, rca_b_1_out;
    assign out[7:4] = rca_a_carry? rca_b_1_out : rca_b_0_out;
    assign carry_out = rca_a_carry? rca_b_1_carry : rca_b_0_carry;
    RCA #4 rca_a(A[3:0], B[3:0], out[3:0], rca_a_carry);
    RCA #(4,0) rca_b_0(A[7:4], B[7:4], rca_b_0_out, rca_b_0_carry);
    RCA #(4,1) rca_b_1(A[7:4], B[7:4], rca_b_1_out, rca_b_1_carry);
endmodule
