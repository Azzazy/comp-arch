module ALU_ControlUnit(input [1:0] ALUop, input [31:0] Instruction, output reg [3:0] ALU_Selection);
wire [3:0] Concatenated;
assign Concatenated[3:0] = {Instruction[14:12], Instruction[30]};
always @(*) begin
    if(ALUop == 2'b00)
        ALU_Selection=4'b0010;
    else if (ALUop == 2'b01)
        ALU_Selection=4'b0110;
    else begin
        case(Concatenated)
            4'b0000: //ADD
                ALU_Selection=4'b0010;
            4'b0001: //SUB
                ALU_Selection=4'b0110;
            4'b1110: //AND
                ALU_Selection=4'b0000;
            4'b1100: //OR
                ALU_Selection=4'b0001;
        endcase
    end 
end
endmodule
