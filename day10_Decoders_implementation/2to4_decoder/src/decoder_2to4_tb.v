`timescale 1ns/1ps

module decoder_2to4_tb;

    reg [1:0] in;
    reg en;
    wire [3:0] out;

    // Instantiate the design module
    decoder_2to4 dut (.in(in), .en(en), .out(out));

    initial begin
        $display("== 2:4 Decoder Testbench ==");
        $display("EN | IN  | OUT");
        $monitor("%b  | %b  | %b", en, in, out);

        // Test all inputs with enable = 1
        en = 1;
        in = 2'b00; #5;
        in = 2'b01; #5;
        in = 2'b10; #5;
        in = 2'b11; #5;

        en = 0;
        in = 2'b10; #5;

        $finish;
    end

//    // Optional waveform generation
//    initial begin
//        $dumpfile("decoder_2to4_tb.vcd");
//        $dumpvars(0, decoder_2to4_tb);
//    end

endmodule
