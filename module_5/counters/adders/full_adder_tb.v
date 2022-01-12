`include "./full_adder.v"
module full_adder_tb;
reg bit1, bit2, carry_in;
wire carry_out, result;

full_adder uut(bit1, bit2, carry_in, result, carry_out);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, full_adder_tb);

    bit1 = 0; bit2 = 0; carry_in = 0; #100
    bit1 = 0; bit2 = 0; carry_in = 1; #100
    bit1 = 0; bit2 = 1; carry_in = 0; #100
    bit1 = 0; bit2 = 1; carry_in = 1; #100
    bit1 = 1; bit2 = 0; carry_in = 0; #100
    bit1 = 1; bit2 = 0; carry_in = 1; #100
    bit1 = 1; bit2 = 1; carry_in = 0; #100
    bit1 = 1; bit2 = 1; carry_in = 1; #100
    $finish;
end
endmodule