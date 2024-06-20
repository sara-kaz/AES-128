`timescale 1ns / 1ps

module inv_row (D_out, clk, D_in);

    output reg [127:0] D_out;
     input [127:0] D_in;
     input clk;

	 always @(clk) begin
	    D_out[127:120] = D_in[127:120];
		D_out[119:112] = D_in[23:16];
		D_out[111:104] = D_in[47:40];
		D_out[103:96] = D_in[71:64];
		
		D_out[95:88] = D_in[95:88];
	    D_out[87:80] = D_in[119:112];
		D_out[79:72] = D_in[15:8];
		D_out[71:64] = D_in[39:32];
		
		D_out[63:56] = D_in[63:56];
		D_out[55:48] = D_in[87:80];
	    D_out[47:40] = D_in[111:104];
		D_out[39:32] = D_in[7:0];
		
		D_out[31:24] = D_in[31:24];
		D_out[23:16] = D_in[55:48];
		D_out[15:8] = D_in[79:72];
	    D_out[7:0] =  D_in[103:96];
	 end
endmodule