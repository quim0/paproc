`timescale 1ns / 1ns
`include "register_file.v"

module rf_tb;

reg [4:0] r1_idx;
reg [4:0] r2_idx;
reg [4:0] write_idx;
reg [31:0] write_data;
reg rwrite;

wire [31:0] r1_result;
wire [31:0] r2_result;

// Create the unit under test module
register_file uut(r1_idx, r2_idx, write_idx, write_data, rwrite, r1_result,
r2_result);

initial begin
    $dumpfile("register_file.vcd");
    $dumpvars(0, rf_tb);

    // Write test
    rwrite = 1;
    write_idx = 5'd1;
    write_data = 32'hdeadbeef;
    #20
    rwrite = 1;
    write_idx = 5'd2;
    write_data = 32'hcafebabe;
    #20

    // Read test
    rwrite = 0;
    r1_idx = 5'd1;
    r2_idx = 5'd2;
    #20

    // Write + read test
    rwrite = 1;
    write_idx = 5'd2;
    write_data = 32'hdeadc0de;
    r1_idx = 5'd1;
    r2_idx = 5'd2;
    #20
    

    $display("Register file test complete");
    $finish;
end
endmodule
