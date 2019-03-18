module ALU(input [31:0] A, input [31:0] B, input [3:0]  Selector, output reg [31:0] Output, output zero);
    wire Add_Selector;
    wire [31:0] adder_output;
    wire [31:0] and_output;
    wire [31:0] or_output;
    RippleCarryAdder adder(A, B, adder_output, Add_Selector);
    And and_instance(A, B, and_output);
    Or or_instance(A, B, or_output);
    always @(*) 
        case(Selector)          
            4'b0010:
                Output = adder_output; //Add                  
            4'b0110:
                Output = adder_output; //Sub                    
            4'b0000:
                Output = and_output; //AND
            4'b0001:
                Output = or_output;  //OR
        endcase 
    assign zero = (Output == 0);
    assign Add_Selector = (Selector == 4'b0110);
endmodule