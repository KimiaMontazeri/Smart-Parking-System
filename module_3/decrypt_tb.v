`timescale 1 ns/1 ns
`include "decrypt.v"

module decrypt_tb;
    reg exit;
    reg  [2:0] token;
    reg  [2:0] pattern;
    wire [2:0] park_number;

    decrypt uut(exit, token, pattern, park_number);

    initial begin
        $dumpfile("result.vcd");
        $dumpvars(0, decrypt_tb);

        pattern = 010;
        
        exit = 0; token = 3'b000; #20;
        exit = 1; token = 3'b000; #20;
        exit = 1; token = 3'b001; #20;
        exit = 1; token = 3'b010; #20;
        exit = 1; token = 3'b011; #20;
        exit = 1; token = 3'b100; #20;
        exit = 1; token = 3'b101; #20;
        exit = 1; token = 3'b110; #20;
        exit = 1; token = 3'b111; #20;

        $finish;
    end 
endmodule
