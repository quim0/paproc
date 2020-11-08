`timescale 1ns / 1ns
`include "imm_generator.v"

module imm_generator_tb;

reg [31:0] instruction;
wire [31:0] immediate;

parameter R_FORMAT_OPCODE = 7'b0110011;
parameter I_FORMAT_OPCODE = 7'b0010011;
parameter LD_OPCODE = 7'b0000011;
parameter ST_OPCODE = 7'b0100011;
parameter BEQ_OPCODE = 7'b1100011;
parameter JAL_OPCODE = 7'b1101111;

// Create the unit under test module
immediate_generator uut(instruction, immediate);

initial begin
    $dumpfile("imm_generator.vcd");
    $dumpvars(0, imm_generator_tb);

    // I format instruction test, correct immediate = 0x000002fe
    instruction = {12'b001011111110, 5'b0, 3'b0, 5'b0, I_FORMAT_OPCODE};
    #20

    // I format instruction test, correct immediate = 0xfffffffe
    instruction = {12'b111111111110, 5'b0, 3'b0, 5'b0, I_FORMAT_OPCODE};
    #20

    // LD (I format) instruction, correct immediate = 0x000002fa
    instruction = {12'b001011111010, 5'b0, 3'b0, 5'd0, LD_OPCODE};
    #20

    // ST (S format) instruction, correct immediate = 0x000002fe
    instruction = {7'b0010111, 5'b0, 5'b0, 3'b0, 5'b11110, ST_OPCODE};
    #20

    // BEQ (B format) instruction, correct immediate = 0xffffffe
    instruction = {7'b1111111, 5'b0, 5'b0, 3'b0, 5'b11111, BEQ_OPCODE};
    #20

    // JAL (J format) instruction, correct immediate = 0x0000cafe
    instruction = {1'b0, 10'b0101111111, 1'b1, 8'b00001100, 5'b0, JAL_OPCODE};
    #20

    $display("Immediate generator test complete");
    $finish;
end
endmodule
