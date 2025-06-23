`timescale 1ns/1ps

module decoder_3to8_tb;
    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the 3:8 decoder module
    decoder_3to8 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("== 3:8 Decoder Testbench ==");
        $display("IN   | OUT");

        in = 3'b000; #5; $display("%b | %b", in, out);
        in = 3'b001; #5; $display("%b | %b", in, out);
        in = 3'b010; #5; $display("%b | %b", in, out);
        in = 3'b011; #5; $display("%b | %b", in, out);
        in = 3'b100; #5; $display("%b | %b", in, out);
        in = 3'b101; #5; $display("%b | %b", in, out);
        in = 3'b110; #5; $display("%b | %b", in, out);
        in = 3'b111; #5; $display("%b | %b", in, out);

        $finish;
    end
endmodule
