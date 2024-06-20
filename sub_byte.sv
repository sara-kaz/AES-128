`timescale 1 ns / 100 ps

module sub_bytes(D_out, clk, D_in);
    
    output reg [127:0] D_out;
    input [127:0] D_in;
	input clk;

	wire[127:0] s_out;
	
	genvar i;

	generate
	 for(i=0;i<16;i=i+1) begin: S_boxes
		 s_box s1 (s_out[(8*i+7):8*i],D_in[(8*i+7):8*i]); 
	 end	
	endgenerate

	always @(posedge clk) D_out = s_out;
	 
endmodule