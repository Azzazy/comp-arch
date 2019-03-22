module RippleCarryAdder(input [31:0] A, input [31:0] B, output [31:0] Sum, input Selection);
    wire [32:0] Carry;
    wire [32-1:0] NewB;
    assign NewB = (Selection)? ~B : B;
    assign Carry[0] = Selection;
    genvar i;
    generate
        for(i=0;i<32;i=i+1)
            FullAdder f(A[i],NewB[i],Carry[i],Sum[i],Carry[i+1]);
    endgenerate
endmodule