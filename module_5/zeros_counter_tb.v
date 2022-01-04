`include "./zeros_counter.v"
module zeroes_counter_tb;
reg [3:0] parked;
wire [3:0] empty;

zeros_counter uut(parked, empty);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, zeroes_counter_tb);

    parked = 4'b0000; #100
    parked = 4'b0001; #100
    parked = 4'b0010; #100
    parked = 4'b0011; #100
    parked = 4'b0100; #100
    parked = 4'b0101; #100
    parked = 4'b0110; #100
    parked = 4'b0111; #100
    parked = 4'b1000; #100
    $finish;
end
endmodule