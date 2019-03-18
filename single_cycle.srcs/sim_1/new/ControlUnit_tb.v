module ControlUnit_tb();
    reg [31:0]Instruction;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0]ALUOp;
    wire  MemWrite;
    wire ALUSrc;
    wire RegWrite;
    ControlUnit CU(Instruction,Branch,MemRead ,MemtoReg,ALUOp,MemWrite ,ALUSrc ,RegWrite );
    initial begin
    Instruction=0;
    #50 Instruction[6:2]=5'b01100;
    #50 Instruction[6:2]=5'b00000;
    #50 Instruction[6:2]=5'b01000;
    #50 Instruction[6:2]=5'b11000;
    end
endmodule
