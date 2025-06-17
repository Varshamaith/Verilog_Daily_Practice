module tb_encoder_8to3;
    reg [7:0] D;
    wire [2:0] Y;

    encoder_8to3 dut (
        .D(D),
        .Y(Y)
    );

    initial begin
        $monitor("Time = %0t | Input D = %b | Output Y = %b", $time, D, Y);

        D = 8'b00000001; #10; 
        D = 8'b00000010; #10; 
        D = 8'b00000100; #10; 
        D = 8'b00001000; #10; 
        D = 8'b00010000; #10; 
        D = 8'b00100000; #10; 
        D = 8'b01000000; #10; 
        D = 8'b10000000; #10; 

        D = 8'b00000110; #10; // Invalid- Multiple inputs high 
        $finish;
    end
endmodule
