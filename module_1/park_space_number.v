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

always @(enable or parking_capacity) begin
    if (enable == 1) begin
        casex (parking_capacity)
            8'bxxxxxxx1: park_number = 3'b000;
            8'bxxxxxx10: park_number = 3'b001;
            8'bxxxxx100: park_number = 3'b010;
            8'bxxxx1000: park_number = 3'b011;
            8'bxxx10000: park_number = 3'b100;
            8'bxx100000: park_number = 3'b101;
            8'bx1000000: park_number = 3'b110;
            8'b10000000: park_number = 3'b111;
            default: park_number = 3'bxxx;
        endcase 
    end else begin
        park_number = 3'bxxx;
    end
end
endmodule