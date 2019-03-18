module Mux_2by1_32(input [31:0] A, input [31:0] B, input S, output reg [31:0] C);
    always @(*)
        if(S==1)
            C=A;
        else
            C=B;
endmodule

