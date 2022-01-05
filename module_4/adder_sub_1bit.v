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
---  Module Name: adder_sub_1bit
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module adder_sub_1bit(a, b, sel, Cin, sum, Cout);
	 
	 input a, b, sel, Cin;
	 output sum, Cout;
	 wire x, y, w0, w1, w2, w3;
	 
	 assign x = a;
	 
	 xor g0(y, b, sel);
	 xor g1(w0, x, y);
	 xor g2(sum, Cin, w0);
	 
	 and g3(w1, y, Cin);
	 and g4(w2, x, y);
	 and g5(w3, x, Cin);
	 
	 or g6(Cout, w1, w2, w3);

endmodule
