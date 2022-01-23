`include "./controller.v"
module controller_tb;
	reg [2:0]      system_token;
	reg            request;
	reg  [7:0]    TimeData;
	reg           reset;
	reg           clock;
	reg           confirm ;
	reg  [2:0]    user_token;
	wire   [7:0]  data_Q;
	wire   [7:0]  data_P;

	controller uut (system_token, request, TimeData, reset, clock, confirm, user_token, data_Q, data_P);

	initial begin
		$dumpfile("result.vcd");
		$dumpvars(0, controller_tb);

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
		TimeData = 8'b11110010;
	end

	initial
	begin
		clock = 1'b0;
		#600 $finish; 
	end

	always
	#10 clock = ~clock;
endmodule