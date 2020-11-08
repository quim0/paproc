// alu_op are opcode bit 6,5,4,2
module alu_control(alu_op, func3, func7, alu_op_control);

input [4:0] alu_op;
input [2:0] func3;
// Only the two top bits of func7 are interesting for the instructins we want to
// implement, this corresponds to func7[6:5]. If the instruction type don't have
// func7, this will be set to 0.
input [1:0] func7;
output reg [4:0] alu_op_control;

reg [3:0] compressed_op;

// Packed opcodes to get the instruction type
parameter R_TYPE_ARITHMETIC_OPCODE = 4'b0110;
parameter I_TYPE_ARITHMETIC_OPCODE = 4'b0010;
parameter LD_OPCODE = 4'b0000;
parameter ST_OPCODE = 4'b0100;
parameter BEQ_OPCODE = 4'b1100;
parameter JAL_OPCODE = 4'b0100;

always @(*) begin
    compressed_op = {alu_op[4:2], alu_op[0]};
    case (compressed_op)
        R_TYPE_ARITHMETIC_OPCODE:
            begin
                alu_op_control <= {func3[2:0], func7[1:0]};
            end
        I_TYPE_ARITHMETIC_OPCODE:
            begin
                alu_op_control <= {func3[2:0], 2'b00};
            end
        BEQ_OPCODE:
            // TODO: BEQ really have to do a sub operation in ALU?, there's no
            // sub with immediate!!
            begin
                // Sub operation
                alu_op_control <= 5'b00001;
            end
        LD_OPCODE, ST_OPCODE, JAL_OPCODE:
            begin
                // Operation should be sum of register and imm
                alu_op_control <= 5'b00000;
            end
    endcase
end

endmodule
