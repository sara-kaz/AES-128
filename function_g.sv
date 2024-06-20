`timescale 1 ns / 1 ps


module function_g (w, i, D_out);
      
    input [31:0] w;
    input [3:0] i;
    output [31:0] D_out;
	
	wire [31:0] shift_w ;
	wire [7:0] S_wire;
	reg [7:0] RC;

	assign shift_w[31:24] = w[23:16];
	assign shift_w[23:16] = w[15:8];
	assign shift_w[15:8] = w[7:0];
	assign shift_w[7:0] = w[31:24];
	
	s_box S3( D_out[7:0], shift_w[7:0]);
	s_box S2( D_out[15:8], shift_w[15:8]);
	s_box S1( D_out[23:16], shift_w[23:16]);
	s_box S0( S_wire, shift_w[31:24]);
	
	always@(*)
		begin

		case (i)
		
		 4'd01: RC = 8'h01;
		 4'd02: RC = 8'h02;
		 4'd03: RC = 8'h04;
		 4'd04: RC = 8'h08;
		 4'd05: RC = 8'h10;
		 4'd06: RC = 8'h20;
		 4'd07: RC = 8'h40;
		 4'd08: RC = 8'h80;
		 4'd09: RC = 8'h1B;
		 4'd10: RC = 8'h36;
		 default:
			RC = 8'h01;
		endcase
	end
		
		assign D_out[31:24]=S_wire^RC;
		
endmodule