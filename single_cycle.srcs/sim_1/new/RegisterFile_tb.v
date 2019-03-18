module RegisterFile_tb();
   reg [31:0]WriteData;
   reg WriteEnable;
   reg [4:0]The_Write_Selector_Of_The_Decoder;
   reg clk;
   reg [4:0] Selector1;
   reg [4:0] Selector2;
   wire [31:0] DataOutput1;
   wire [31:0] DataOutput2;
   RegisterFile Hamada(WriteData,Selector1,Selector2,The_Write_Selector_Of_The_Decoder,clk,WriteEnable,DataOutput1,DataOutput2 );
                initial begin
                #10 WriteEnable=1;           
                #50 WriteData=4347574;
                Selector1=20;
                Selector2=23;
                The_Write_Selector_Of_The_Decoder=20;//destination
                
                #100 clk=1;
                #10 clk=0;
                 #50 WriteData=57654;
                                Selector1=20;
                                Selector2=23;
                                The_Write_Selector_Of_The_Decoder=23;//destination
                                #100 clk=1;
                                #10 clk=0;
              end  
                
   
endmodule