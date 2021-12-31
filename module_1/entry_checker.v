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
---  Module Name: entry_checker 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module entry_checker(entry, parking_capacity, enable);
input entry;
input [7:0] parking_capacity;
output enable;
wire have_capacity;
assign have_capacity = parking_capacity[0] ||
                        parking_capacity[1] ||
                        parking_capacity[2] ||
                        parking_capacity[3] ||
                        parking_capacity[4] ||
                        parking_capacity[5] ||
                        parking_capacity[6] ||
                        parking_capacity[7];

assign enable = have_capacity && entry;

endmodule