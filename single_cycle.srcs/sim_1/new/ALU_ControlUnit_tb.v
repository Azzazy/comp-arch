module ALU_ControlUnit_tb();
reg [1:0]ALUop;
reg [31:0]Instruction;
wire [3:0]ALU_Selection;
ALU_ControlUnit ALUCU(ALUop,Instruction,ALU_Selection);
initial  begin
    Instruction=0;
    #10 ALUop=2'b00;
    #50 ALUop=2'b01;
    #50 ALUop=2'b10;
    #50 Instruction[14:12]=3'b000;
        Instruction[30]=1'b0;
    #50 Instruction[14:12]=3'b000;
        Instruction[30]=1'b1;
    #50 Instruction[14:12]=3'b111;
        Instruction[30]=1'b0;
    #50 Instruction[14:12]=3'b110;
        Instruction[30]=1'b0;
end
endmodule
