`timescale 1 ns/1 ns

module half_subtractor(bit1, bit2, diff, borrow);
input bit1;
input bit2;
output diff;
output borrow;

wire bit1_not;
not bit_not_calculator(bit1_not, bit1);

xor diff_calculator(diff, bit1, bit2);
and borrow_calculator(borrow, bit1_not, bit2);
endmodule