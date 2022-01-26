/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 9931078 - 9931072
--  Student Name: Kimia Montazeri & Sina Shariati
--  Student Mail: kimia.mtz@gmail.com - sina.shariati@aut.ac.ir
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: smart_parking
-----------------------------------------------------------*/
`include "update_capacity.v"
`include "../module_1/entry_park.v"
`include "../module_2/token_production.v"
`include "../module_3/exit_park.v"
`include "../module_3/calculate_new_capacity.v"
`include "../module_4/time_calculate.v"
`include "../module_5/parking_capacity_counter.v"
`timescale 1 ns/1 ns
module smart_parking(
input entry,
input [7:0] parking_capacity,
input exit,
input [2:0] pattern,
input [7:0] time_out,
input [7:0] time_in,
output [7:0] new_capacity,
output [7:0] time_total,
output [3:0] parked,
output [3:0] empty
);

    // wire [2:0] park_number;
    // wire [2:0] token;
    // wire [7:0] park_location;

    // entry_park entered(entry, parking_capacity, park_number); // module 1
    // token_production get_token(park_number, pattern, token);  // module 2
    // exit_park has_exited(exit, token, pattern, park_location); // module 3
    // calculate_new_capacity get_new_cap(park_location, parking_capacity, new_capacity); // module 3
    // parking_capacity_counter get_parking_cap(new_capacity, parked, empty); // module 4
    // time_calculate cal_time(time_out, time_in, time_total); // module 5

    wire [2:0] park_number;
    wire [2:0] token;
    wire [7:0] park_location;
    wire [7:0] parking_capacity_new;
    wire [7:0] cap;

    entry_park has_entered(entry, parking_capacity, park_number);
    update_capacity update_cap(entry, parking_capacity, parking_capacity_new, cap);
    token_production get_token(park_number, pattern, token);
    exit_park has_exited(exit, token, pattern, park_location);
    calculate_new_capacity get_new_cap(park_location, parking_capacity_new, new_capacity);
    parking_capacity_counter get_parking_cap(new_capacity, parked, empty);
    time_calculate cal_time(time_out, time_in, time_total);
endmodule