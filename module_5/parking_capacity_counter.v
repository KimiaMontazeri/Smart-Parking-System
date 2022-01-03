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
`include "./ones_counter.v"
`include "./zeroes_counter.v"
module parking_capacity_counter(new_capacity, parked, empty);
input [7:0] new_capacity;
output [2:0] parked;
output [2:0] empty;

ones_counter ones_counter(new_capacity, parked);
zeroes_counter zero_counter(parked, empty);
endmodule