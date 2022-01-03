`include "./ones_counter.v"

module parking_capacity_counter_tb;
reg [7:0] new_capacity;
wire [2:0] parked;

ones_counter uut(new_capacity, parked);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, parking_capacity_counter_tb);

    new_capacity = 1111_0000; #100
    new_capacity = 1111_1111; #100
    new_capacity = 0000_0001; #100
    new_capacity = 0001_0001; #100
    new_capacity = 0011_0011; #100
    new_capacity = 0101_1001; #100
    new_capacity = 1010_1010; #100
    $finish;
end
endmodule