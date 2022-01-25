`timescale 1ns / 1ps
module register_manager(
    input [2:0] system_token,
    input [2:0] user_token,
    input [7:0] TimeData,
    input clock,
    input request,
    input confirm,
    input reset,
    output reg RegP,
    output reg RegQ
);
    reg [2:0] present_state, next_state;
    parameter A = 3'b000, B = 3'b001, C = 3'b101, D = 3'b111, E = 3'b110;

    always @(posedge clock)
    begin
        if (request) present_state = next_state;
        else present_state = A;
    end

    always @ (present_state or request or confirm or TimeData)
    case (present_state)
        A: if (request) next_state = B;
            else next_state = A;

        B: if (~request) next_state = A;
            else if (~confirm) next_state = B;
            else if (system_token == user_token) next_state = C;
            else if (system_token != user_token) next_state = E;

        C: if (~request) next_state = A;
            else if(confirm) next_state = D;
            else next_state = 3'bxxx;

        D: if (~request) next_state = A;
            else if (confirm)begin
                if (TimeData[4] == 1'b1 && TimeData[5] == 1'b1 && TimeData[6] == 1'b1 && TimeData[7] == 1'b1) begin
                    assign RegP = 1'b1;
                    assign RegQ = 1'b0;
                end else begin
                    assign RegQ = 1'b1;
                    assign RegP = 1'b0;
                end
            end
            
        E: if (~request) next_state = A;
            else next_state = E;
    endcase
endmodule