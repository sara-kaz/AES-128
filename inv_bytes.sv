`timescale 1 ns / 1 ps

module inv_bytes(D_out, clk, D_in);

    output reg [127:0] D_out;
    input [127:0] D_in;
    input clk;

	wire [127:0] inv_S_out;
	
	genvar i;
	generate
	 for(i=0; i<16; i=i+1) begin : Inverse
		 inv_s_box inv_S1(inv_S_out[(8*i+7):8*i], D_in[(8*i+7):8*i]); 	
	 end
	endgenerate

    always @(posedge clk) D_out = inv_S_out;

endmodule

