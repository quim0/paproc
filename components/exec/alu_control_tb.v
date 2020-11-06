`timescale 1ns / 1ns
`include "alu_control.v"

module alu_control_tb;

reg [4:0] alu_op;
reg [2:0] func3;
reg [1:0] func7;

wire [4:0] alu_op_control;

parameter ADD_FUNC3 = 3'b000;
parameter SUB_FUNC3 = 3'b000;
parameter XOR_FUNC3 = 3'b100;
parameter OR_FUNC3 = 3'b110;
parameter AND_FUNC3 = 3'b111;
parameter UNKNOWN_FUNC3 = 3'bxxx;

parameter ADD_FUNC7 = 2'b00;
parameter SUB_FUNC7 = 2'b01;
parameter XOR_FUNC7 = 2'b00;
parameter OR_FUNC7 = 2'b00;
parameter AND_FUNC7 = 2'b00;
parameter IMM_FUNC7 = 2'bxx;

parameter RTYPE_OPCODE = 5'b01100;
parameter ITYPE_OPCODE = 5'b00100;
parameter LD_OPCODE = 5'b00000;
parameter ST_OPCODE = 5'b01000;
parameter BEQ_OPCODE = 5'b11000;
parameter JAL_OPCODE = 5'b11011;


// Create the unit under test module
alu_control uut(alu_op, func3, func7, alu_op_control);

initial begin
    $dumpfile("alu_control.vcd");
    $dumpvars(0, alu_control_tb);

    // Check ADD
    alu_op = RTYPE_OPCODE;
    func3 = ADD_FUNC3;
    func7 = ADD_FUNC7;
    #20

    // Check ADDI
    alu_op = ITYPE_OPCODE;
    func3 = ADD_FUNC3;
    func7 = IMM_FUNC7;
    #20

    // Check SUB
    alu_op = RTYPE_OPCODE;
    func3 = SUB_FUNC3;
    func7 = SUB_FUNC7;
    #20

    // Check BEQ
    alu_op = BEQ_OPCODE;
    func3 = UNKNOWN_FUNC3;
    func7 = IMM_FUNC7;
    #20

    // Check LD
    alu_op = LD_OPCODE;
    func3 = UNKNOWN_FUNC3;
    func7 = IMM_FUNC7;
    #20

    $display("ALU control test complete");
    $finish;
end
endmodule
