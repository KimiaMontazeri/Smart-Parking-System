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
---  Module Name: entry_park 
-----------------------------------------------------------*/
`include "./entry_checker.v"
`include "./park_space_number.v"
`timescale 1 ns/1 ns
module entry_park(entry,parking_capacity,park_number);
input entry;
input [7:0] parking_capacity;
output [2:0] park_number;

wire enable;  
entry_checker have_capacity(entry, parking_capacity, enable);
park_space_number get_park_number(enable, parking_capacity, park_number);

endmodule