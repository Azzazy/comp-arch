module DataPath_tb();
    reg clk;
    reg rst;
    reg [1:0] ledSel;
    reg [3:0] ssdSel;
    wire [15:0] leds;
    wire [12:0] ssd;
    DataPath dataPath(clk, rst, ledSel, ssdSel, leds, ssd);
    initial begin
        rst=1;
        ssdSel=0;
        ledSel=0;
        clk=0;//pc=0
        #10
        rst=0;
        #10
        clk=1;//pc=4
        #10
        clk=0;
        ssdSel=0;//PC
        ssdSel = 4'b1100; #10//ALU_Selection
        ssdSel = 4'b0100; #10//A
        ssdSel = 4'b1001; #10//B
        ssdSel = 4'b1010; #10 // ALU Out
        #10
        clk=1;//pc=8
        #10
        clk=0;
        #10
        clk=1;//pc=12
        #10
        clk=0;
        
        ssdSel=0;#10//PC
        ssdSel = 4'b1100; #10//ALU_Selection
        ssdSel = 4'b0100; #10//A
        ssdSel = 4'b1001; #10//B
        ssdSel = 4'b1010; #10 // ALU Out
        
        #10
        clk=1;//pc=16
        #10
        clk=0;
    end
endmodule
