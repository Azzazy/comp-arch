module DataPath_Demo (input clk_sevenSeg, input clk, input rst, input [1:0] ledSel, input [3:0] ssdSel, output [15:0] leds, output [3:0] Anode, output [6:0] LED_out);
    wire [12:0] ssd;
    DataPath dataPath(clk, rst, ledSel, ssdSel, leds, ssd);
    Four_Digit_Seven_Segment_Driver four_Digit_Seven_Segment_Driver(clk_sevenSeg, ssd, Anode, LED_out);     
endmodule
