module ALU (A, B, ALU_op, ALU_result, zero);

parameter ALU_SIZE = 32;
parameter ALU_OP_SIZE = 5;

input CLK;
input [ALU_SIZE-1:0] A;
input [ALU_SIZE-1:0] B;
input [ALU_OP_SIZE-1:0] ALU_op;

output reg [ALU_SIZE-1:0] ALU_result;
output zero;

parameter ADD_OP = 5'b00000;
parameter SUB_OP = 5'b00010;
parameter AND_OP = 5'b11100;
parameter OR_OP = 5'b11000;
parameter XOR_OP = 5'b10000;

assign zero = (ALU_result == 0);

always @(*) begin
    // casex ignores all the X (unknown) and Z (high impedance) values.
    casex (ALU_op)
        ADD_OP:
            ALU_result = A + B;
        SUB_OP:
            ALU_result = A - B;
        AND_OP:
            ALU_result = A & B;
        OR_OP:
            ALU_result = A | B;
        XOR_OP:
            ALU_result = A ^ B;
    endcase
end

endmodule
