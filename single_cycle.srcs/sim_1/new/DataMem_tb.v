module DataMem_tb();
    reg clk, MemRead, MemWrite;
    reg [9:0] addr;
    reg [31:0] data_in;
    wire [127:0] data_out;
    wire ready;
    DataMem dataMem (clk, MemRead, MemWrite, addr, data_in, data_out, ready);
    
    always #50 clk = ~clk;
    
    initial begin
        clk = 0;
        addr = 0;
        MemWrite = 1;
        data_in = 45;
        #100
        MemWrite = 0;
        #500
        MemRead = 1;
    end  
endmodule
