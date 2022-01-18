/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 9931072 - 9931078
--  Student Name: sina shariati - kimia montazeri
--  Student Mail: sina.shariati@aut.ac.ir - kimia.mtz@gmail.com
--  *******************************************************
--*/

/*-----------------------------------------------------------
---  Module Name: controller
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module controller(system_token, request, time_data, clock, confirm, user_token, data_to_save, enable_P, enable_Q);

input [2:0] system_token;
input request;
input [7:0] time_data;
input clock;
input confirm;
input [2:0] user_token;
output reg [7:0] data_to_save;
output reg enable_P;
output reg enable_Q;

reg [1:0] present_state;
reg [1:0] next_state;
// define states
parameter start = 2'b00, active = 2'b01, request_process = 2'b10, trap = 2'b11;

always @(posedge clock or negedge request) begin
    if (~request) present_state = start;
    else present_state = next_state;
end

always @(present_state or confirm or request or time_data or system_token or user_token) begin
    case(present_state) 
        start: if(request) next_state = active;
                else next_state = start;
        
        active: if (~request) next_state = start; 
                else if(request & ~confirm) next_state = active;
                else if(request & confirm & user_token == system_token) next_state = request_process;
                else if(request & confirm & user_token != system_token) next_state = trap;
        
        trap: if (~request) next_state = start;
    endcase
end

// evaluate output
always @(present_state or confirm or request or user_token) begin 
    case (present_state) 
        start: begin enable_P = 1'b0; enable_Q= 1'b0; end
        active: begin enable_P = 1'b0; enable_Q= 1'b0; end

        trap: begin enable_P = 1'b0; enable_Q = 1'b0; end
        request_process: begin
             if (time_data[4] == 1 && time_data[5] == 1 && time_data[6] == 1 && time_data[7] == 1) begin
                enable_P= 1'b1; 
                enable_Q = 1'b0; 
                data_to_save = time_data;
            end else begin
                enable_P = 1'b0; 
                enable_Q = 1'b1; 
                data_to_save = time_data;
            end
        end
    endcase
end
endmodule