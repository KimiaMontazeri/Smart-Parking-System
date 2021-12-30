`include "token_production.v"
`timescale 1 ns/1 ns

module token_production_tb;
    reg  [2:0] park_number;
    reg  [2:0] pattern;
    wire [2:0] token;

    token_production uut(park_number, pattern, token);

    initial begin
        $dumpfile("token_production_tb.vcd");
        $dumpvars(0, token_production_tb);

        pattern = 3'b010;

        park_number = 3'b000;
        #20;
        park_number = 3'b001;
        #20;
        park_number = 3'b010;
        #20;
        park_number = 3'b011;
        #20;
        park_number = 3'b100;
        #20;
        park_number = 3'b101;
        #20;
        park_number = 3'b110;
        #20;
        park_number = 3'b111;
        #20;

        $finish;
    end 
endmodule