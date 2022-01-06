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
---  Module Name: exit_parking_lot
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module exit_parking_lot(park_number, park_location);
    input      [2:0] park_number;
    output reg [7:0] park_location;

    always @(park_number) begin
        case (park_number)
            3'b000: park_location = 8'b00000001;
            3'b001: park_location = 8'b00000010;
            3'b010: park_location = 8'b00000100;
            3'b011: park_location = 8'b00001000;
            3'b100: park_location = 8'b00010000;
            3'b101: park_location = 8'b00100000;
            3'b110: park_location = 8'b01000000;
            3'b111: park_location = 8'b10000000;
            default: park_location = 8'bxxxxxxxx;
        endcase
    end
endmodule