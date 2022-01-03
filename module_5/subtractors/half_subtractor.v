`timescale 1 ns/1 ns

module half_subtractor(bit1, bit2, diff, carry);
input bit1;
input bit2;
output diff;
output carry;

xor diff_calculator(diff, bit1, bit2);
and carry_calculator(carry, bit1, bit2);
endmodule