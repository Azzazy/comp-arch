module ALU_tb();
    reg [31:0] A;
    reg [31:0] B;
    wire [3:0] Selector;
    wire [31:0] Output_of_the_ALU;
    wire zero;
    ALU ALU_DEVICE(A,B,Selector,Output_of_the_ALU,zero);
    
    reg [1:0] ALUop;
    reg [31:0] Instruction;
    wire [3:0] conc;
    ALU_ControlUnit ALU_cu(ALUop, Instruction, Selector, conc);
    
    initial begin
//        A=49;   
//        B=25;
//        #60 Selector=2;
//        #50 Selector=6;
//        #50 Selector=0;
//        #50 Selector=1;
//        #50 Selector=15;
//        A=15;   
//        B=15;
//        #50 Selector=6;
//        A=9;   
//        B=17;
//        #50 Selector=1;
//        #50 Selector=2;
//        #50 Selector=6;
//        #50 Selector=0;

        ALUop = 2'b10;
        A=9;   
        B=17;
        Instruction=32'b0000000_00010_00001_110_00100_0110011 ;
    end
endmodule
