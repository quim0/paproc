module register_file(r1_idx, r2_idx, write_idx, write_data, 
                     rwrite, r1_result, r2_result);

parameter RSIZE = 32;
parameter NREGS = 32;

// Register file is indexed with 5 bits, because 2^5 = 32
input [4:0] r1_idx;
input [4:0] r2_idx;
input [4:0] write_idx;
input [RSIZE-1:0] write_data;
// Write signal
input rwrite;

output reg [RSIZE-1:0] r1_result;
output reg [RSIZE-1:0] r2_result;

reg [NREGS-1:0] reg_mem [RSIZE-1:0];

always @(*) begin
    // Avoid writes to register 0, as it is hardcoded to 0
    if (rwrite && (write_idx != 0))
        reg_mem[write_idx] <= write_data;

    // R1 read
    if (r1_idx == 0)
        r1_result <= 0;
    else begin
        if ((r1_idx == write_idx) && rwrite)
            r1_result <= write_data;
        else
            r1_result <= reg_mem[r1_idx];
    end

    // R2 read
    if (r2_idx == 0)
        r2_result <= 0;
    else begin
        if ((r2_idx == write_idx) && rwrite)
            r2_result <= write_data;
        else
            r2_result <= reg_mem[r2_idx];
    end
end

endmodule
