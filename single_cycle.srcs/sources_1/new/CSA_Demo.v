module CSA_Demo (input clk, input [7:0] A, input [7:0] B, output [3:0] Anode, output [6:0] LED_out);
    wire [7:0] cca_out;
    wire carry_out;
    Four_Digit_Seven_Segment_Driver four_Digit_Seven_Segment_Driver(clk, {4'd0, carry_out, cca_out}, Anode, LED_out);   
    CSA csa(A, B, cca_out, carry_out);
endmodule

