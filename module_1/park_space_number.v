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
---  Module Name: park_space_number 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module park_space_number(enable, parking_capacity, park_number);
input enable;
input [7:0] parking_capacity;
output reg [2:0] park_number;

always @(enable) begin
    case (parking_capacity)
        8'b1111_1110: park_number = 3'b000;
        8'b1111_1101: park_number = 3'b001;
        8'b1111_1011: park_number = 3'b010;
        8'b1111_0111: park_number = 3'b011;
        8'b1110_1111: park_number = 3'b100;
        8'b1101_1111: park_number = 3'b101;
        8'b1011_1111: park_number = 3'b110;
        8'b0111_1111: park_number = 3'b111;
        default: park_number = 3'b000;
    endcase 
end
endmodule