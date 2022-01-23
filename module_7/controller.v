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
---  Module Name: controller
-----------------------------------------------------------*/
`include "./register_manager.v"
`include "./register.v"
`timescale 1 ns/1 ns
module controller(
input [2:0] system_token,
input request,
input [7:0] TimeData,
input reset,
input clock,
input confirm,
input [2:0] user_token,
output [7:0] data_Q,
output [7:0] data_P
);

wire P_register_enable, Q_register_enable;

register_manager manager(system_token, user_token, TimeData ,clock, request, confirm, reset, P_register_enable, Q_register_enable);

register P_register(TimeData, clock, reset, P_register_enable, data_P);
register Q_register(TimeData, clock, reset, Q_register_enable, data_Q);
endmodule