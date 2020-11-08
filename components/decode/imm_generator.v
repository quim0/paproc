module immediate_generator(inst, immediate);

input [31:0] inst;
output reg [31:0] immediate;

parameter I_FORMAT = 7'b0010011;
parameter LD = 7'b0000011;
parameter ST = 7'b0100011;
parameter BEQ = 7'b1100011;
parameter JAL = 7'b1101111;

always @(*) begin
    // inst[6:0] is the opcode
    case (inst[6:0])
        I_FORMAT, LD: immediate <= {{21{inst[31]}}, inst[30:20]};
        ST:  immediate <= {{21{inst[31]}}, inst[30:25], inst[11:7]};
        BEQ: immediate <= {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
        JAL: immediate <= {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
        default: immediate <= {32{1'bx}};
    endcase
end

endmodule
