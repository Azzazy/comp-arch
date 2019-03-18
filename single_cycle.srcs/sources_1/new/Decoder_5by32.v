module Decoder_5by32(input [4:0] Selector,input WriteEnable, output [31:0] Load);
    assign Load=WriteEnable?(1'b1<<Selector):0;
endmodule