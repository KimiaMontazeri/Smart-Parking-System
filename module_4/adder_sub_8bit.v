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
---  Module Name: adder_sub_8bit
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
`include "../module_4/adder_sub_1bit.v"
module adder_sub_8bit(A, B, sel, Z, Cout);
    input [7:0] A;
    input [7:0] B;
    input sel; // 0 +, 1 -
    output [7:0] Z;
    output Cout;

	wire Cin0, Cin1, Cin2, Cin3, Cin4, Cin5, Cin6, Cin7;
	 
	assign Cin0 = sel;
	 
	adder_sub_1bit asb0(A[0], B[0], sel, Cin0, Z[0], Cin1);
	adder_sub_1bit asb1(A[1], B[1], sel, Cin1, Z[1], Cin2);
	adder_sub_1bit asb2(A[2], B[2], sel, Cin2, Z[2], Cin3);
	adder_sub_1bit asb3(A[3], B[3], sel, Cin3, Z[3], Cin4);
    adder_sub_1bit asb4(A[4], B[4], sel, Cin4, Z[4], Cin5);
    adder_sub_1bit asb5(A[5], B[5], sel, Cin5, Z[5], Cin6);
    adder_sub_1bit asb6(A[6], B[6], sel, Cin6, Z[6], Cin7);
    adder_sub_1bit asb7(A[7], B[7], sel, Cin7, Z[7], Cout);
	 

endmodule