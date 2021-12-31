`include "./entry_park.v"
module entry_park_tb;
reg entry;
reg [7:0] parking_capacity;
wire [2:0] park_number;

entry_park uut(entry, parking_capacity, park_number);

initial begin
      $dumpfile("result.vcd");
      $dumpvars(0, entry_park_tb);

      entry = 0; parking_capacity = 8'b00000001; #100;
      entry = 0; parking_capacity = 8'b00000010; #100;
      entry = 0; parking_capacity = 8'b00000100; #100;
      entry = 0; parking_capacity = 8'b00001000; #100;
      entry = 0; parking_capacity = 8'b00010000; #100;
      entry = 0; parking_capacity = 8'b00100000; #100;
      entry = 0; parking_capacity = 8'b01000000; #100;
      entry = 0; parking_capacity = 8'b10000000; #100;

      entry = 1; parking_capacity = 8'b00000001; #100;
      entry = 1; parking_capacity = 8'b00000010; #100;
      entry = 1; parking_capacity = 8'b00000100; #100;
      entry = 1; parking_capacity = 8'b00001000; #100;
      entry = 1; parking_capacity = 8'b00010000; #100;
      entry = 1; parking_capacity = 8'b00100000; #100;
      entry = 1; parking_capacity = 8'b01000000; #100;
      entry = 1; parking_capacity = 8'b10000000; #100;
      $finish;
    end
endmodule