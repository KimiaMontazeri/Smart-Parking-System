`include "./register_manager.v"
module register_manager_tb;
reg [2:0] system_token;
reg [2:0] user_token;
reg [7:0] TimeData;
reg clock;
reg request;
reg confirm;
reg reset;
wire P_register_enable;
wire Q_register_enable;

register_manager uut(system_token, user_token, TimeData, clock, request, confirm, reset,P_register_enable, Q_register_enable);

initial begin
    $dumpfile("result.vcd");
	$dumpvars(0, register_manager_tb);

	system_token = 3'b101;
	request = 1'b0;
	reset = 1'b0;
			
			
	#30
	reset = 1'b1;
	request = 1'b1;

	#30
	//S1
	request = 1'b1;
	confirm = 1'b1;
	user_token = 3'b101;
			
	#40
	//S2
	request = 1'b1;
	confirm = 1'b1;
	TimeData = 8'b01110010;
	end

	initial
	begin
		clock = 1'b0;
		#600 $finish; 
	end

	always
	#10 clock = ~clock;
endmodule