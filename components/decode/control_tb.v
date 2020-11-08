`timescale 1ns / 1ns
`include "control.v"

module control_tb;

reg [6:0] opcode;
wire branch;
wire jump;
wire regwrite;
wire memread;
wire alu_src;

parameter R_FORMAT = 7'b0110011;
parameter I_FORMAT = 7'b0010011;
parameter LD = 7'b0000011;
parameter ST = 7'b0100011;
parameter BEQ = 7'b1100011;
parameter JAL = 7'b1101111;

// Create the unit under test module
control uut(opcode, branch, jump, regwrite, memwrite, memread, alu_src);

initial begin
    $dumpfile("control.vcd");
    $dumpvars(0, control_tb);

    opcode = R_FORMAT;
    #20
    opcode = I_FORMAT;
    #20
    opcode = LD;
    #20
    opcode = ST;
    #20
    opcode = BEQ;
    #20
    opcode = JAL;
    #20

    // Write test
    $display("Control test complete");
    $finish;
end
endmodule
