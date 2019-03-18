module Register(input clk, input [31:0] A, input Load, output [31:0] Qt);
    wire [31:0] D;
    genvar i;
    generate
        for(i=0;i<32;i=i+1) begin 
            Mux_2by1 M(A[i],Qt[i],Load,D[i]); //Initialize Multiplexer
            DFlipFlop Df(clk,D[i],Qt[i]);
            
        end
        endgenerate
endmodule