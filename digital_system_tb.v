`timescale 1ns/1ps

module digital_system_tb;

reg clk;
reg reset;
reg start;
reg load;
reg [3:0] A, B;
reg [2:0] opcode;

wire [3:0] result;
wire carry;
wire done;

digital_system DUT (
    .clk(clk),
    .reset(reset),
    .start(start),
    .load(load),
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .done(done)
);

always #5 clk = ~clk;

task apply_test;
    input [3:0] a_in;
    input [3:0] b_in;
    input [2:0] op_in;
    begin
        A = a_in;
        B = b_in;
        opcode = op_in;
        load = 1'b1;
        #10;
        load = 1'b0;
        #5;
        $display("Time=%0t A=%b B=%b OP=%b RESULT=%b CARRY=%b",
                 $time, A, B, opcode, result, carry);
    end
endtask

initial begin
    $dumpfile("digital_system.vcd");
    $dumpvars(0, digital_system_tb);

    clk = 0;
    reset = 1;
    start = 0;
    load = 0;
    A = 0;
    B = 0;
    opcode = 0;

    #12;
    reset = 0;

    // ADD: 5 + 3 = 8
    apply_test(4'd5, 4'd3, 3'b000);

    // SUB: 9 - 4 = 5
    apply_test(4'd9, 4'd4, 3'b001);

    // AND
    apply_test(4'b1100, 4'b1010, 3'b010);

    // OR
    apply_test(4'b1100, 4'b1010, 3'b011);

    // XOR
    apply_test(4'b1100, 4'b1010, 3'b100);

    // FSM test
    start = 1;
    #10;
    start = 0;
    #20;

    $display("Simulation completed.");
    $finish;
end

endmodule
