module ImmGen(input [31:0] Instruction, output reg [31:0] Immediate);
    always @(*) begin
        case(Instruction[6:5])
            2'b11:begin //BEQ
                Immediate = 0;
                Immediate[11:0] =  {Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8]};
            end
            2'b00: begin //LW
                Immediate = 0;
                Immediate[11:0] =  Instruction[31:20];
            end
            2'b01: begin//SW
                Immediate = 0;
                Immediate[11:0] =  {Instruction[31:25], Instruction[11:7]};
            end
        endcase
    end
endmodule
