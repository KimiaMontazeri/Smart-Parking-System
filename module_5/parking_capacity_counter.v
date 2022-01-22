/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 9931072 - 9931078
--  Student Name: sina shariati - kimia montazeri
--  Student Mail: sina.shariati@aut.ac.ir - kimia.mtz@gmail.com
--  *******************************************************
--*/

/*-----------------------------------------------------------
---  Module Name: parking_capacity_counter
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
`include "../module_5/counters/ones_counter.v"
`include "../module_5/counters/zeros_counter.v"
module parking_capacity_counter(new_capacity, parked, empty);
input [7:0] new_capacity;
output [3:0] parked;
output [3:0] empty;

ones_counter ones_counter(new_capacity, empty);
zeros_counter zero_counter(empty, parked);
endmodule