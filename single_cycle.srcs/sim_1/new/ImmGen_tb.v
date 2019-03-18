module ImmGen_tb();
    reg [31:0] Instruction;
    wire [31:0] Immediate;
    ImmGen immGen(Instruction, Immediate);
    
    initial begin
        Instruction = 32'b000000000000_00000_010_00001_0000011;           
        #50 
        Instruction = 32'b000000001000_00000_010_00011_0000011;     
        #50 
        Instruction = 32'b0_000000_00011_00100_000_0100_0_1100011;     
        #50 
        Instruction = 32'b0000000_00101_00000_010_01100_0100011;
    end  
endmodule