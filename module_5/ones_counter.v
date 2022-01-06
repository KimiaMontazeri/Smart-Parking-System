`include "./full_adder.v"
`timescale 1 ns/1 ns
module ones_counter(new_capacity, parked);
input [7:0] new_capacity;
output [3:0] parked;

wire carry1, result1;
wire carry2, result2; 
wire carry3, result3;

full_adder adder1(new_capacity[0], new_capacity[1], new_capacity[2], result1, carry1);
full_adder adder2(new_capacity[3], new_capacity[4], new_capacity[5], result2, carry2);
half_adder adder3(new_capacity[6], new_capacity[7], result3, carry3);

// calculate the sum of carries and sum of results
wire carries_sum_result,  carries_sum_carry;
wire results_sum_result, results_sum_carry;
full_adder carries_adder(carry1, carry2, carry3, carries_sum_result, carries_sum_carry);
full_adder results_adder(result1, result2, result3, results_sum_result, results_sum_carry);

// calculate the final result
wire ignore_1, ignore_2, bit_1_carry, bit_2_carry;
half_adder result_calculator_0(1'b0, results_sum_result, parked[0], ignore_1);
half_adder result_calculator_1(carries_sum_result, results_sum_carry, parked[1], bit_1_carry);
half_adder result_calculator_2(bit_1_carry, carries_sum_carry, parked[2], bit_2_carry);
half_adder result_calculator_3(1'b0, bit_2_carry, parked[3], ignore_2);

endmodule
