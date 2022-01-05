`include "./half_adder.v"

module half_adder_tb;
reg bit1, bit2;
wire carry, sum;

half_adder uut(bit1, bit2, result, carry);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, half_adder_tb);

    bit1 = 0; bit2 = 0; #100
    bit1 = 0; bit2 = 1; #100
    bit1 = 1; bit2 = 0; #100
    bit1 = 1; bit2 = 1; #100
    $finish;
end

endmodule