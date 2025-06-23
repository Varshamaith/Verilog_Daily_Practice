`timescale 1ns/1ps

module decoder_4to16_tb;

    reg [3:0] in;
    wire [15:0] out;

    // Instantiate the 4:16 decoder module
    decoder_4to16 uut (
        .in(in),
        .out(out)
    );

    initial begin
        //$display("== 4:16 Decoder Testbench ==");
        $display("IN    | OUT");

        in = 4'b0000; #5; $display("%b | %b", in, out);
        in = 4'b0001; #5; $display("%b | %b", in, out);
        in = 4'b0010; #5; $display("%b | %b", in, out);
        in = 4'b0011; #5; $display("%b | %b", in, out);
        in = 4'b0100; #5; $display("%b | %b", in, out);
        in = 4'b0101; #5; $display("%b | %b", in, out);
        in = 4'b0110; #5; $display("%b | %b", in, out);
        in = 4'b0111; #5; $display("%b | %b", in, out);
        in = 4'b1000; #5; $display("%b | %b", in, out);
        in = 4'b1001; #5; $display("%b | %b", in, out);
        in = 4'b1010; #5; $display("%b | %b", in, out);
        in = 4'b1011; #5; $display("%b | %b", in, out);
        in = 4'b1100; #5; $display("%b | %b", in, out);
        in = 4'b1101; #5; $display("%b | %b", in, out);
        in = 4'b1110; #5; $display("%b | %b", in, out);
        in = 4'b1111; #5; $display("%b | %b", in, out);

        $finish;
    end
endmodule
