`timescale 1 ns/1 ns
`include "./half_adder.v"
module full_adder(bit1, bit2, carry_in, result, carry_out);
input bit1;
input bit2;
input carry_in;

output result;
output carry_out;

wire adder1_carry, adder2_carry, adder1_result;

half_adder adder1(bit1, bit2, adder1_result, adder1_carry );
half_adder adder2(adder1_result, carry_in, result, adder2_carry);

or carry_out_calculator(carry_out, adder1_carry, adder2_carry);
endmodule