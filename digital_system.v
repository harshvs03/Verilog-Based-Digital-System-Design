module digital_system (
    input        clk,
    input        reset,
    input        start,
    input        load,
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] opcode,
    output [3:0] result,
    output       carry,
    output       done
);

wire [3:0] alu_result;
wire [3:0] stored_result;

alu_4bit U_ALU (
    .A(A),
    .B(B),
    .opcode(opcode),
    .Y(alu_result),
    .carry(carry)
);

register_4bit U_REG (
    .clk(clk),
    .reset(reset),
    .load(load),
    .D(alu_result),
    .Q(stored_result)
);

controller_fsm U_FSM (
    .clk(clk),
    .reset(reset),
    .start(start),
    .done(done)
);

assign result = stored_result;

endmodule
