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
---  Module Name: register
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module register(
input [7:0] D,
input CLK, 
input RST,
input en,
output [7:0] Q;
);
always @(posedge CLK) begin
    if (reset) 
       Q = 8'b0000_0000 ;
    else
        Q = D;
end
endmodule