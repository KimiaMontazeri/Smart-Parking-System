`include "half_subtractor.v"

module half_subtractor_tb;
reg bit1, bit2;
wire diff, borrow;

half_subtractor uut(bit1, bit2, diff, borrow);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, half_subtractor_tb);

    bit1 = 0; bit2 = 0; #100
    bit1 = 0; bit2 = 1; #100
    bit1 = 1; bit2 = 0; #100
    bit1 = 1; bit2 = 1; #100
    $finish;
end
endmodule