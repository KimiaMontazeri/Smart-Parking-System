`include "./register.v"
module register_tb;
reg [7:0] D;
reg CLK ;
reg RST;
reg en;
wire [7:0] Q;

register uut(D, CLK, RST, en, Q);

initial begin
    CLK = 1'b0;
    repeat(60) 
    #10 CLK = ~CLK;
end

initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, register_tb);
    RST = 0; en = 1; 

    // checking data saving functionality
    #10 D = 8'b0000_0000; #20 
    D = 8'b0000_0001; #20 
    D = 8'b0000_0011; #20 
    D = 8'b0000_0111; #20 
    D = 8'b0000_1111; #20 
    D = 8'b0001_1111; #20 
    D = 8'b0010_1111; #20 
    D = 8'b0100_1111; #20 
    D = 8'b1111_1111; #20 

    // checking RST
    RST = 1; #20

    // checking en
    en = 0;
    D = 1111_1111; #30
    $finish;
end
endmodule