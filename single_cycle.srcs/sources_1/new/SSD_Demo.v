module SSD_Demo (input clk, input [12:0] ssd, output [3:0] Anode, output [6:0] LED_out);
    Four_Digit_Seven_Segment_Driver four_Digit_Seven_Segment_Driver(clk, ssd, Anode, LED_out);     
endmodule
