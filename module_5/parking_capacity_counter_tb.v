`include "./parking_capacity_counter.v"
module parking_capacity_counter_tb;
reg [7:0] new_capacity;
wire [2:0] parked;
wire [2:0] empty;

parking_capacity_counter uut(new_capacity, parked, empty);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, parking_capacity_counter_tb);

    new_capacity = 1111_0000; #100 
    new_capacity = 0000_0001; #100
    new_capacity = 0000_0011; #100
    new_capacity = 0000_0111; #100
    new_capacity = 0000_1111; #100
    new_capacity = 0001_1111; #100
    new_capacity = 0011_1111; #100
    new_capacity = 0111_1111; #100
    new_capacity = 1111_1111; #100
    $finish;
end
endmodule