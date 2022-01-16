`timescale 1 ns/1 ns
`include "counters/subtractors/half_subtractor.v"

module full_subtractor(bit1, bit2, borrow_in, diff, borrow_out);
input bit1;
input bit2;
input borrow_in;

output diff;
output borrow_out;

wire diff_1, borrow_out_1, borrow_out_2;

half_subtractor subtractor_1(bit1, bit2, diff_1, borrow_out_1);
half_subtractor subtractor_2(diff_1, borrow_in, diff, borrow_out_2);
or borrow_out_calculator(borrow_out, borrow_out_1, borrow_out_2);
endmodule