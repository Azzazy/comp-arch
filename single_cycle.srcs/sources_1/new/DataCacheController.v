module DataCacheController (
 input clk,
 input MemRead,
 input MemWrite,
 input [4:0] index,
 input [2:0] tag,
 output reg stall,
 output fill,
 output update,
 output MsRead,
 input MsReady);

endmodule