`include "./full_subtractor.v"
`timescale 1 ns/1 ns

module zeros_counter(parked, empty);
input [2:0] parked;
output [2:0] empty;
wire borrow_out_0, borrow_out_1, borrow_out_2, ignore_1, ignore_2;

half_subtractor subtractor_0(1'b0, parked[0], empty[0], borrow_out_0);
full_subtractor subtractor_1(1'b0, parked[1], borrow_out_0, empty[1], borrow_out_1);
full_subtractor subtractor_2(1'b0, parked[2], borrow_out_1, empty[2], borrow_out_2);
full_subtractor subtractor_3(1'b1, 1'b0, borrow_out_2, ignore_1, ignore_2);
endmodule