`include "./entry_checker.v"
module entry_checker_tb;
reg [7:0] parking_capacity;
reg entry;
wire enable;

entry_checker uut(entry, parking_capacity, enable);

initial begin
      $dumpfile("result.vcd");
      $dumpvars(0, entry_checker_tb);

      entry = 0; parking_capacity = 0; #100
      entry = 0; parking_capacity = 1; #100
      entry = 0; parking_capacity = 2; #100
      entry = 0; parking_capacity = 3; #100
      entry = 0; parking_capacity = 4; #100
      entry = 0; parking_capacity = 5; #100
      entry = 0; parking_capacity = 6; #100
      entry = 0; parking_capacity = 7; #100

      entry = 1; parking_capacity = 0; #100
      entry = 1; parking_capacity = 1; #100
      entry = 1; parking_capacity = 2; #100
      entry = 1; parking_capacity = 3; #100
      entry = 1; parking_capacity = 4; #100
      entry = 1; parking_capacity = 5; #100
      entry = 1; parking_capacity = 6; #100
      entry = 1; parking_capacity = 7; #100
      $finish;
    end
endmodule