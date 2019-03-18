module DataPath (input clk, input rst, input [1:0] ledSel, input [3:0] ssdSel, output reg [15:0] leds, output reg [12:0] ssd);
    reg [31:0] pc_next;
    reg [31:0] pc;
    
    wire [31:0] Instruction;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    ControlUnit controlUnit(Instruction, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    
    wire [31:0] reg_DataOutput1;
    wire [31:0] reg_DataOutput2;
    wire [31:0] reg_WriteData;
    RegisterFile registerFile(clk, rst, reg_WriteData, Instruction[19:15], Instruction[24:20], Instruction[11:7], RegWrite, reg_DataOutput1, reg_DataOutput2);
    
    wire [31:0] Immediate;
    ImmGen immGen(Instruction, Immediate);
    
    wire [31:0] ALU_B;
    Mux_2by1 mux_2by1_ALU(reg_DataOutput2, Immediate, ALUSrc, ALU_B);
    
    wire [3:0] ALU_Selection;
    ALU_ControlUnit aLU_ControlUnit(ALUop, Instruction, ALU_Selection);
    
    wire [31:0] ALU_out;
    wire ALU_zero;
    ALU aLU(reg_DataOutput1, ALU_B, ALU_Selection, ALU_out, ALU_zero);
    
    wire [31:0] mem_DataOut;
    DataMem dataMem(clk, MemRead, MemWrite, ALU_out[5:0], reg_DataOutput2, mem_DataOut);
    
    Mux_2by1 mux_2by1_mem(mem_DataOut, ALU_out, MemtoReg, reg_WriteData);
    
    InstMem instMem(pc[7:2], Instruction);   
    
    reg [31:0] Imm_shifted;
    ShiftLeft_1 shiftLeft_1(Immediate, Imm_shifted);     
      
    initial 
        pc=0;
          
    always @ (posedge clk or posedge rst) 
        if (rst) 
            pc=0;
        else 
            pc <= pc_next;
            
    always @(*) begin
        if (ALU_zero & Branch)
            pc_next <= pc + Imm_shifted;
        else
            pc_next <= pc + 4;
        case(ledSel)
            2'b00: 
                leds =  Instruction[15:0];
            2'b01: 
                leds =  Instruction[31:16];
            2'b10: begin
                leds[0] = Branch;
                leds[1] = MemRead;
                leds[2] = MemtoReg;
                leds[4:3] = ALUOp;
                leds[5] = MemWrite;
                leds[6] = ALUSrc;
                leds[7] = RegWrite;
                leds[15:8]=0;
            end
        endcase 
        case(ssdSel)
            4'b0000://PC
                ssd =  pc[12:0];
            4'b0001://PC + 4
                ssd =  pc[12:0] + 4;
            4'b0010://Branch target address
                ssd =  pc[12:0] + Imm_shifted;
            4'b0011:// PC input
                ssd =  pc_next[12:0];
            4'b0100:// data read from the register file based on RS1
                ssd =  reg_DataOutput1[12:0];
            4'b0101:// data read from the register file based on RS2
                ssd =  reg_DataOutput2[12:0];
            4'b0110:// data provided as an input to the register file
                ssd =  reg_WriteData[12:0];
            4'b0111://  immediate generator output
                ssd =  Immediate[12:0];
           
        endcase 
    end
endmodule
