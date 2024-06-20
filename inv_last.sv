`timescale 1 ns / 1 ps

module inv_last (D_out, clk, D_in, key_in);

    output [127:0] D_out;
    input [127:0] D_in, key_in;
    input clk;

	wire [127:0] sub_out, row_out;

    inv_row sr0(row_out, clk, D_in);
	inv_bytes sb0(sub_out, clk, row_out);
	assign D_out = sub_out^key_in;

endmodule