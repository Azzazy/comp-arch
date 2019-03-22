module RCA_Demo (input clk, input [7:0] A, input [7:0] B, output [3:0] Anode, output [6:0] LED_out);
    wire [7:0] rca_out;
    wire carry_out;
    Four_Digit_Seven_Segment_Driver four_Digit_Seven_Segment_Driver(clk, {4'd0, carry_out, rca_out}, Anode, LED_out);   
    RCA #8 rca(A, B, rca_out, carry_out);
endmodule
