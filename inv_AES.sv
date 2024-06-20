`timescale 1 ns / 1 ps

module inv_AES (D_out, clk, D_in, key);
    
    output [127:0] D_out;
    input [127:0] D_in, key;
    input clk;

    wire [127:0] ky, ky0, ky1, ky2, ky3, ky4, ky5, ky6, ky7, ky8, ky9;
    wire [127:0] r, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

    assign r = D_in^ky9;
    key_expansion UUT (ky, ky0, ky1, ky2, ky3, ky4, ky5, ky6, ky7, ky8, ky9, key);

    inv_round rd0 (r0, clk, r, ky8);
    inv_round rd1 (r1, clk, r0, ky7);
    inv_round rd2 (r2, clk, r1, ky6);
    inv_round rd3 (r3, clk, r2, ky5);
    inv_round rd4 (r4, clk, r3, ky4);
    inv_round rd5 (r5, clk, r4, ky3);
    inv_round rd6 (r6, clk, r5, ky2);
    inv_round rd7 (r7, clk, r6, ky1);
    inv_round rd8 (r8, clk, r7, ky0);
    inv_last rd9 (r9, clk, r8, ky);

    assign D_out = r9;

endmodule