`timescale 1ns / 1ns
`include "adder_sub_1bit.v"

module adder_sub_1bit_tb;

	// Inputs
	reg a;
	reg b;
	reg sel;
	reg Cin;

	// Outputs
	wire sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	adder_sub_1bit uut (
		.a(a), 
		.b(b), 
		.sel(sel), 
		.Cin(Cin), 
		.sum(sum), 
		.Cout(Cout)
	);

	initial begin

		$dumpfile("result.vcd");
        $dumpvars(0, adder_sub_1bit_tb);
		
		// testing addition 
		sel = 0;
		a = 0; b = 0; Cin = 0;
		#50;
		
		a = 0; b = 0; Cin = 1;
		#50;
		
		a = 0; b = 1; Cin = 0;
		#50;
		
		a = 0; b = 1; Cin = 1;
		#50;
		
		a = 1; b = 0; Cin = 0;
		#50;
		
		a = 1; b = 0; Cin = 1;
		#50;
		
		a = 1; b = 1; Cin = 0;
		#50;
		
		a = 1; b = 1; Cin = 1;
		#50;
		
		
		// testing subtraction 
		sel = 1;
		a = 0; b = 0; Cin = 0;
		#50;
		
		a = 0; b = 0; Cin = 1;
		#50;
		
		a = 0; b = 1; Cin = 0;
		#50;
		
		a = 0; b = 1; Cin = 1;
		#50;
		
		a = 1; b = 0; Cin = 0;
		#50;
		
		a = 1; b = 0; Cin = 1;
		#50;
		
		a = 1; b = 1; Cin = 0;
		#50;
		
		a = 1; b = 1; Cin = 1;
		#50;

		$finish;
	end
      
endmodule

