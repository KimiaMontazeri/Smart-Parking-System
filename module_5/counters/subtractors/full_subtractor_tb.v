`include "./full_subtractor.v"

module full_subtractor_tb;
reg bit1;
reg bit2;
reg borrow_in;

wire diff;
wire borrow_out;

full_subtractor uut(bit1, bit2, borrow_in, diff, borrow_out);

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, full_subtractor_tb);

    bit1 = 0; bit2 = 0; borrow_in= 0; #100
    bit1 = 0; bit2 = 0; borrow_in= 1; #100
    bit1 = 0; bit2 = 1; borrow_in= 0; #100
    bit1 = 0; bit2 = 1; borrow_in= 1; #100
    bit1 = 1; bit2 = 0; borrow_in= 0; #100
    bit1 = 1; bit2 = 0; borrow_in= 1; #100
    bit1 = 1; bit2 = 1; borrow_in= 0; #100
    bit1 = 1; bit2 = 1; borrow_in= 1; #100
    $finish;
end
endmodule