`timescale 1 ns / 1 ps

module AES_tb ();
    
    wire [127:0] en_out, dec_out;
    reg [127:0] D_in, key;
    reg clk, match;

    AES UUT (en_out, clk, D_in, key);
    inv_AES UUT2 (dec_out, clk, en_out, key);

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
        #10 match = 0;
    end

    always @(posedge clk) 
        if (D_in === dec_out) match = 1;

    initial begin 
        $vcdpluson;
        
        key = 128'h5468617473206D79204B756E67204675;
        $display ("Key is: %h", key);

        $display ("Encryption");
        D_in = 128'h54776F204F6E65204E696E652054776F;
        $display ("%d: Word = %h", $time, D_in);
        #400 $display ("%d: Encrypted = %h", $time, en_out);
        
        $display ("Decryption");
        $display  ("%d: Encrypted = %h", $time, en_out);
        #400 $display ("%d: Dencrypted = %h", $time, dec_out);

        $display ("Encryption");
        D_in = 128'haa456F2040547F6E6520E64E6965276F;
        $display ("%d: Word = %h", $time, D_in);
        #400 $display ("%d: Encrypted = %h", $time, en_out);
        
        $display ("Decryption");
        $display  ("%d: Encrypted = %h", $time, en_out);
        #400 $display ("%d: Dencrypted = %h", $time, dec_out);

        $display ("Encryption");
        D_in = 128'h647F6a456F520E620405E64E65276F69;
        $display ("%d: Word = %h", $time, D_in);
        #400 $display ("%d: Encrypted = %h", $time, en_out);
        
        $display ("Decryption");
        $display  ("%d: Encrypted = %h", $time, en_out);
        #400 $display ("%d: Dencrypted = %h", $time, dec_out);

        #400 $finish;
    end

endmodule