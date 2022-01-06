`timescale 1 ns/1 ns
`include "calculate_new_capacity.v"

module calculate_new_capacity_tb;
    reg  [7:0] park_location;
    reg  [7:0] parking_capacity;
    wire [7:0] new_capacity;

    calculate_new_capacity uut(park_location, parking_capacity, new_capacity);

    initial begin
        $dumpfile("result.vcd");
        $dumpvars(0, calculate_new_capacity_tb);

        // car exits
        park_location = 8'b00000001; parking_capacity = 8'b11000000; #20;
        park_location = 8'b00000010; parking_capacity = 8'b11000001; #20;
        park_location = 8'b00000100; parking_capacity = 8'b11000000; #20;
        park_location = 8'b00001000; parking_capacity = 8'b11000011; #20;
        // car enters
        park_location = 8'b00010000; parking_capacity = 8'b00110010; #20;
        park_location = 8'b00100000; parking_capacity = 8'b11100110; #20;
        park_location = 8'b01000000; parking_capacity = 8'b11000111; #20;
        park_location = 8'b10000000; parking_capacity = 8'b11100100; #20;

        $finish;
    end 
endmodule
