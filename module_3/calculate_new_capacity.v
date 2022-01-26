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
---  Module Name: calculate_new_capacity
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module calculate_new_capacity(park_location, parking_capacity, new_capacity);
    input  [7:0] park_location;
    input  [7:0] parking_capacity;
    output reg [7:0] new_capacity;
    integer i;

    always @ (park_location) begin
        new_capacity = parking_capacity;
        for (i = 0; i < 8; i = i + 1) begin
            if (park_location[i] == 1) begin
                new_capacity[i] = ~parking_capacity[i];
            end else begin
                new_capacity[i] = parking_capacity[i];
            end
        end
    end
    
endmodule