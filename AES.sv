`timescale 1 ns / 1 ps

module AES (D_out, clk, D_in, key);
    
    inout [127:0] D_out;
    input [127:0] D_in, key;
    input clk;

    wire [127:0] ky, ky0, ky1, ky2, ky3, ky4, ky5, ky6, ky7, ky8, ky9;
    wire [127:0] r, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

    assign r = D_in^ky;
    key_expansion UUT (ky, ky0, ky1, ky2, ky3, ky4, ky5, ky6, ky7, ky8, ky9, key);

    round rd0 (r0, clk, r, ky0);
    round rd1 (r1, clk, r0, ky1);
    round rd2 (r2, clk, r1, ky2);
    round rd3 (r3, clk, r2, ky3);
    round rd4 (r4, clk, r3, ky4);
    round rd5 (r5, clk, r4, ky5);
    round rd6 (r6, clk, r5, ky6);
    round rd7 (r7, clk, r6, ky7);
    round rd8 (r8, clk, r7, ky8);
    last_round rd9 (r9, clk, r8, ky9);

    assign D_out = r9;

endmodule