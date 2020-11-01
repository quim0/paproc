`timescale 1ns / 1ns
`include "alu.v"

module alu_tb;

reg [31:0] A;
reg [31:0] B;
reg [4:0] ALU_op;

wire [31:0] ALU_result;
wire zero;

parameter ADD_OP = 5'b00000;
parameter SUB_OP = 5'b00010;
parameter AND_OP = 5'b11100;
parameter OR_OP = 5'b11000;
parameter XOR_OP = 5'b10000;

// Create the unit under test module
ALU uut(A, B, ALU_op, ALU_result, zero);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    A = 2;
    B = 1;

    // ADD
    ALU_op = ADD_OP;
    #20

    // SUB
    ALU_op = SUB_OP;
    #20

    // AND
    ALU_op = AND_OP;
    #20

    // OR
    ALU_op = OR_OP;
    #20

    // XOR
    ALU_op = XOR_OP;
    #20

    // Test zero signal
    A = 0;
    B = 0;
    ALU_op = ADD_OP;
    #20

    $display("ALU test complete");
    $finish;
end
endmodule
