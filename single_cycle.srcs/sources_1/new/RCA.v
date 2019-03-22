module RCA(A, B, out, carry_out);
    parameter size = 32, carryin = 0;
    input [size-1:0] A;
    input [size-1:0] B;
    output [size-1:0] out;
    output carry_out;
    wire [size:0] Carry;
    assign Carry[0] = carryin;
    assign carry_out = Carry[size];
    genvar i;
    generate
        for(i=0; i<size; i=i+1)
            FullAdder f(A[i],B[i],Carry[i],out[i],Carry[i+1]);
    endgenerate
endmodule
