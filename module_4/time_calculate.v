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
---  Module Name: time_calculate
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
`include "../module_4/adder_sub_8bit.v"
module time_calculate(time_out, time_in, time_total);
    input [7:0] time_out;
    input [7:0] time_in;
    output [7:0] time_total;
    wire Cout;

    adder_sub_8bit asb(time_out, time_in, 1'b1, time_total, Cout); // sel = 1 ~> subtract
endmodule