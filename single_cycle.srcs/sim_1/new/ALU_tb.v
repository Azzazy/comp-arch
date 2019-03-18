module ALU_tb();
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] Selector;
    wire [31:0] Output_of_the_ALU;
    ALU ALU_DEVICE(A,B,Selector,Output_of_the_ALU);
    initial begin
        A=49;   
        B=25;
        #60 Selector=2;
        #50 Selector=6;
        #50 Selector=0;
        #50 Selector=1;
        #50 Selector=15;
    
    end
endmodule
