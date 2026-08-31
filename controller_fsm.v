module controller_fsm (
    input clk,
    input reset,
    input start,
    output reg done
);

localparam IDLE = 2'b00,
           EXEC = 2'b01,
           DONE = 2'b10;

reg [1:0] state, next_state;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin
    next_state = state;
    done = 1'b0;

    case (state)
        IDLE: begin
            if (start)
                next_state = EXEC;
        end

        EXEC: begin
            next_state = DONE;
        end

        DONE: begin
            done = 1'b1;
            next_state = IDLE;
        end

        default: next_state = IDLE;
    endcase
end

endmodule
