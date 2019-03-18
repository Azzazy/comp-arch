module RegisterFile(input [31:0]WriteData,input [4:0]Selector1,input[4:0]Selector2, input [4:0] The_Write_Selector_Of_The_Decoder,
                    input clk,input WriteEnable,output [31:0]DataOutput1, output [31:0]DataOutput2 );
                    wire [31:0]Load;
                    wire [31:0]REGISTERS_DATA[0:31];
                    Decoder_5by32 Decoder(The_Write_Selector_Of_The_Decoder,WriteEnable,Load);
                    genvar i;
                        generate               
                            for(i=0;i<32;i=i+1) begin 
                                Register R(clk,WriteData,Load[i],REGISTERS_DATA[i]);                                
                       end
                        endgenerate
                    assign DataOutput1=REGISTERS_DATA[Selector1];
                    assign DataOutput2=REGISTERS_DATA[Selector2];
endmodule
