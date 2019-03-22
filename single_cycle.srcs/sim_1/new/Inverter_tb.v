module Inverter_tb();
    reg A;
    wire B;
    Inverter inverter(A, B);
    initial begin
        #10
        A = 1;
        #10
        A = 0;
        #10
        A = 1;
        #10
        A = 0;
    end
endmodule
