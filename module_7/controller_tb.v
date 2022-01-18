`include "./controller.v"
module controller_tb;
reg [2:0] system_token;
reg request;
reg [7:0] time_data;
reg clock;
reg confirm;
reg [2:0] user_token;
wire [7:0] data_to_save;
wire enable_P;
wire enable_Q;

controller uut(system_token, request, time_data, clock, confirm, user_token, data_to_save, enable_P, enable_Q);

// set up the clock
initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, controller_tb);

    clock = 1'b0;
    repeat (60) #50 clock = ~clock;
end

initial begin
    // 'start' state (system setup)
    system_token = 3'b101; request = 1'b0; confirm = 1'b0;  #150;
    // 'active' state
    request = 1'b1; #150 
    // 'request_process' state
    user_token = 3'b101; confirm = 1'b1; #150 
    // enable 'P' register
    time_data = 8'b11110000; #150 
    $finish;
end
endmodule