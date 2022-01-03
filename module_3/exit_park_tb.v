`timescale 1 ns/1 ns
`include "./exit_park.v"

module exit_park_tb;
    reg exit;
    reg  [2:0] token;
    reg  [2:0] pattern;
    wire [7:0] park_location;

    exit_park uut(exit, token, pattern, park_location);

    initial begin
        $dumpfile("result.vcd");
        $dumpvars(0, exit_park_tb);

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
