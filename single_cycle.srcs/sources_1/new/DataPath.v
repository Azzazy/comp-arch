module DataPath (input clk, input rst, input [1:0] ledSel, input [3:0] ssdSel, output reg [15:0] leds, output reg [12:0] ssd);
    reg [31:0] pc;
    wire [31:0] Instruction;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    
    
    
//    RegisterFile(input rst, input [31:0]WriteData,input [4:0]Selector1,input[4:0]Selector2, input [4:0] The_Write_Selector_Of_The_Decoder,
//                        input clk,input WriteEnable,output [31:0]DataOutput1, output [31:0]DataOutput2 );
    ControlUnit controlUnit(Instruction, Branch, MemRead , MemtoReg, ALUOp,  MemWrite, ALUSrc , RegWrite );
//    ALU_ControlUnit(input [1:0] ALUop, input [31:0] Instruction,output reg [3:0]ALU_Selection);
//    DataMem(input clk, input MemRead, input MemWrite,input [5:0] addr, input [31:0] data_in, output [31:0] data_out);
    InstMem instMem(pc[7:2], Instruction);          
//    ALU(input [31:0] A, input [31:0] B, input [3:0]  Selector, output [31:0] Output );
    initial begin
        pc=0;
    end      
    always @ (posedge clk or posedge rst)
    if (rst) begin
        pc=0;
    end 
    else begin
        pc <= pc +4;
    end
    always @(*) begin
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
            4'b0000: 
                ssd =  pc[12:0];
            4'b0001:
                ssd =  pc[12:0] + 4;
           
           
        endcase 
    end
endmodule
