`timescale 1ps/1ps

module register_manager(system_token, user_token, time_data ,clock, request, confirm, reset,P_register_enable, Q_register_enable);
input [2:0] system_token;
input [2:0] user_token;
input [7:0] time_data;
input clock;
input request;
input confirm;
input reset;
output reg P_register_enable;
output reg Q_register_enable;

reg [2:0] present_state, next_state;

parameter start = 3'b000, system_ready = 3'b001, trap = 3'b100, correct_token = 3'b111, enable_register = 3'b011;

// set present state to equal next state
always @ (posedge clock) begin
    if (~reset) begin
        present_state = start;
        next_state = start;
    end 
    present_state = next_state;

    case (present_state)
        system_ready: begin
            if (confirm == 1'b1 && user_token == system_token) next_state = correct_token; 
            else if(confirm == 1'b1 && user_token != system_token) next_state = trap;
        end

        correct_token: begin
            if (confirm == 1'b1) next_state = enable_register; 
        end

        enable_register: begin
            if (time_data[4] == 1'b1 && time_data[5] == 1'b1 && time_data[6] ==  1'b1 && time_data[7] == 1'b1) 
            begin
                    P_register_enable = 1'b1;
                    Q_register_enable = 1'b0; 
            end
            else begin
                    P_register_enable = 1'b0;
                    Q_register_enable = 1'b1; 
            end 
        end
        default: present_state = 3'bxxx;
    endcase
end

always @(negedge request) begin
    present_state = start;
    next_state = start;
end

always @(posedge request) begin
   next_state = system_ready;
end

endmodule