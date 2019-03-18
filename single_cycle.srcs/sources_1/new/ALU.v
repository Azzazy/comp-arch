module ALU(input [31:0] A, input [31:0] B, input [3:0]  Selector, output [31:0] Output );
            reg Add_Selector;
            reg [31:0] Temp_Output;
            wire [31:0] Add_Sub;
            wire [31:0] And;
            wire [31:0] Or;
    always @(*) begin
    if (Selector[3:0] == 4'b0010)
        begin 
         Add_Selector=0 ;
        end
        else if(Selector[3:0] == 4'b0110)
            begin 
         Add_Selector=1 ;
            end
            
   end
    RippleCarryAdder Add_or_Sub_CASE( A, B, Add_Sub,Add_Selector);
    And AND_CASE(A,B,And);
    Or OR_CASE(A,B,Or);
    always @(*) begin //Getting the immediate part
    case(Selector)          
               4'b0010:
                Temp_Output=Add_Sub;//Add                  
               4'b0110:
                Temp_Output=Add_Sub;   //Sub                       
               4'b0000:
                Temp_Output=And; //AND
               4'b0001:
                Temp_Output=Or;  //OR
               default: 
                Temp_Output=0;
                             
      endcase 
  end
    assign Output= Temp_Output;
endmodule