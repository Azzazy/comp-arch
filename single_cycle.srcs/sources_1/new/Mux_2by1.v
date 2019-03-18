module Mux_2by1(input A, input B, input S, output C);
    assign C= (B & (~S)) | (A & S);
endmodule