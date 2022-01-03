`include "./zeros_counter.v"
module zeroes_counter_tb;
reg [2:0] parked;
wire [2:0] empty;

zeros_counter uut(parked, empty);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, zeroes_counter_tb);

    parked = 001; #100
    parked = 010; #100
    parked = 011; #100
    parked = 100; #100
    parked = 101; #100
    parked = 110; #100
    parked = 111; #100
    $finish;
end
endmodule