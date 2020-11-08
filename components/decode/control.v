module control(
    input [6:0] opcode, 
    output reg branch,
    // Controls if the PC is PC+4 or the result of a branch
    output reg jump,
    output reg regwrite,
    output reg memwrite,
    output reg memread,
    // Control the mux that decides if the second parameter of the ALU is a
    // register or an immediate
    output reg alu_src
    // TODO: Add more signals
    );

parameter R_FORMAT = 7'b0110011;
parameter I_FORMAT = 7'b0010011;
parameter LD = 7'b0000011;
parameter ST = 7'b0100011;
parameter BEQ = 7'b1100011;
parameter JAL = 7'b1101111;

always @(*) begin
    case (opcode)
        R_FORMAT:
        begin
            regwrite <= 1'b1;
            branch <= 1'b0;
            jump <= 1'b0;
            memwrite <= 1'b0;
            memread <= 1'b0;
            alu_src <= 1'b0;
        end
        I_FORMAT:
        begin
            regwrite <= 1'b1;
            branch <= 1'b0;
            jump <= 1'b0;
            memwrite <= 1'b0;
            memread <= 1'b0;
            alu_src <= 1'b1;
        end
        LD:
        begin
            regwrite <= 1'b1;
            branch <= 1'b0;
            jump <= 1'b0;
            memwrite <= 1'b0;
            memread <= 1'b1;
            alu_src <= 1'b1;
        end
        ST:
        begin
            regwrite <= 1'b0;
            branch <= 1'b0;
            jump <= 1'b0;
            memwrite <= 1'b1;
            memread <= 1'b0;
            alu_src <= 1'b1;
        end
        BEQ:
        begin
            regwrite <= 1'b0;
            branch <= 1'b1;
            jump <= 1'b0;
            memwrite <= 1'b0;
            memread <= 1'b0;
            alu_src <= 1'b0;
        end
        JAL:
        begin
            // TODO: check regwrite
            regwrite <= 1'b1;
            branch <= 1'b1;
            jump <= 1'b1;
            memwrite <= 1'b0;
            memread <= 1'b0;
            alu_src <= 1'b0;
        end

    endcase
end

endmodule
