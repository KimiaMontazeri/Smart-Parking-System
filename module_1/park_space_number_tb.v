`include "./park_space_number.v"
module park_space_number_tb;
reg enable;
reg [7:0] parking_capacity;
wire [2:0] park_number;

park_space_number uut(enable, parking_capacity, park_number);

initial begin
      $dumpfile("result.vcd");
      $dumpvars(0, park_space_number_tb);

      enable = 0; parking_capacity = 8'b00000001; #100;
      enable = 0; parking_capacity = 8'b00000010; #100;
      enable = 0; parking_capacity = 8'b00000100; #100;
      enable = 0; parking_capacity = 8'b00001000; #100;
      enable = 0; parking_capacity = 8'b00010000; #100;
      enable = 0; parking_capacity = 8'b00100000; #100;
      enable = 0; parking_capacity = 8'b01000000; #100;
      enable = 0; parking_capacity = 8'b10000000; #100;

      enable = 1; parking_capacity = 8'b00000001; #100;
      enable = 1; parking_capacity = 8'b00000010; #100;
      enable = 1; parking_capacity = 8'b00000100; #100;
      enable = 1; parking_capacity = 8'b00001000; #100;
      enable = 1; parking_capacity = 8'b00010000; #100;
      enable = 1; parking_capacity = 8'b00100000; #100;
      enable = 1; parking_capacity = 8'b01000000; #100;
      enable = 1; parking_capacity = 8'b10000000; #100;
      $finish;
    end
endmodule