/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 9931078 9931072
--  Student Name: Kimia Montazeri & Sina Shariati
--  Student Mail: kimia.mtz@gmail.com sina.shariati@aut.ac.ir
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: exti_park 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
`include "../module_3/decrypt.v" 
`include "../module_3/exit_parking_lot.v"
module exit_park(exit, token, pattern, park_location);
    input exit;
    input  [2:0] token;
    input  [2:0] pattern;
    output [7:0] park_location;
    wire   [2:0] park_number;

    decrypt d(exit, token, pattern, park_number);
    exit_parking_lot epl(park_number, park_location);

endmodule