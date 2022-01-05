`timescale 1 ns/1 ns
`include "time_calculate.v"

module time_calculate_tb;
    reg  [7:0] time_out;
    reg  [7:0] time_in;
    wire [7:0] time_total;

    time_calculate uut(time_out, time_in, time_total);

    initial begin
        $dumpfile("result.vcd");
        $dumpvars(0, time_calculate_tb);

        time_in = 8'b00000001; time_out = 8'b00001111; #20;
        time_in = 8'b00001101; time_out = 8'b00110000; #20;
        time_in = 8'b00000000; time_out = 8'b00001101; #20;
        time_in = 8'b01100001; time_out = 8'b10001111; #20;
        time_in = 8'b01100011; time_out = 8'b10010000; #20;
        time_in = 8'b01100001; time_out = 8'b11001111; #20;

        $finish;
    end 
endmodule
