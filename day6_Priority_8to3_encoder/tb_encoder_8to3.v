module tb_priority_encoder_8to3;
    reg [7:0] D;
    wire [2:0] Y;
    wire valid;

    priority_encoder_8to3 uut (.D(D), .Y(Y), .valid(valid));

    initial begin
        $monitor("Time=%0t, D=%b, Y=%b, valid=%b", $time, D, Y, valid);

        D = 8'b00000000; #10;
        D = 8'b00000001; #10;
        D = 8'b00000100; #10;
        D = 8'b10000000; #10;
        D = 8'b01000000; #10;
        D = 8'b00100000; #10;

        $finish;
    end
endmodule
