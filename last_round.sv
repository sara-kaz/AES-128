`timescale 1 ns / 1 ps

module last_round (D_out, clk, D_in, key_in);

    output [127:0] D_out;
    input [127:0] D_in, key_in;
    input clk;

	wire [127:0] sub_out, row_out;

	sub_bytes sb0(sub_out, clk, D_in);
	shift_rows sr0(row_out, clk, sub_out);
	assign D_out = row_out^key_in;

endmodule