`timescale 1ns / 1ns
`include "adder_sub_8bit.v"

module adder_sub_8bit_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg sel;
	// Outputs 
	wire [7:0] Z;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	adder_sub_8bit uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.Z(Z), 
		.Cout(Cout)
	);

	initial begin

        $dumpfile("result.vcd");
        $dumpvars(0, adder_sub_8bit_tb);
		
		// A>0 B>0 both positive 
		A = 8'b00000001;
		B = 8'b00000010;
		
		sel = 0; // 0011
		#100;
		
		sel = 1; // 1111
		#100;
				
		A = 8'b00000110;
		B = 8'b00000100;
		
		sel = 0; // 1010
		#100; 
		
		sel = 1; // Cout = 1, sum = 0010
		#100;
			
			
			
		// A<0 B>0 A negative 
		A = 8'b00001111; // -0001
		B = 8'b00000010;
		
		sel = 0; // Cout = 1, sum = 0001
		#100;
		
		sel = 1; // Cout = 1, sum = 1101
		#100;
		
		A = 8'b00001010; // -0110
		B = 8'b00000100;
		
		sel = 0; // 1110
		#100;
		
		sel = 1; // Cout = 1, 0110
		#100;

	
			
		// A<0 B<0 both negative 
		A = 8'b00001111; // -0001
		B = 8'b00001110; // -0010
		
		sel = 0; // Cout = 1, 1101
		#100;
		
		sel = 1; // Cout = 1, 0001
		#100;
		
		A = 8'b00001010; // -0110
		B = 8'b00001100; // -0100
		
		sel = 0; // Cout = 1, 0110
		#100;
		
		sel = 1; // 1110
		#100;
			
			
			
		$finish;

	end
      
endmodule

