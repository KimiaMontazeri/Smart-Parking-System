`timescale 1 ns/1 ns

module half_adder(bit1, bit2, sum, carry);
input bit1;
input bit2;
output sum;
output carry;

xor sum_calculator(sum, bit1, bit2);
and carry_calculator(carry, bit1, bit2);

endmodule