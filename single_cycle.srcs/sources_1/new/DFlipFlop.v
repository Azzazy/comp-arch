module DFlipFlop(input clk, input D, output reg Q);
    always @(posedge clk)       
    begin        
        Q <= D;
    end
endmodule
