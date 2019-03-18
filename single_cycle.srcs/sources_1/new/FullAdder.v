module FullAdder(input a, input b, input c_in, output sum, output c_out);
    wire a_xor_b;
    wire XOR_c_in;
    wire a_AND_b;
    assign a_xor_b= a ^ b;
    assign sum=a_xor_b ^ c_in;
    assign XOR_c_in= a_xor_b & c_in;
    assign a_AND_b= a & b;
    assign c_out= a_AND_b | XOR_c_in;
endmodule