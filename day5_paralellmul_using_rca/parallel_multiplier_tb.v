module parallel_multiplier_tb;
    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] f;
    parallel_multiplier PLM (A, B, f);

    initial begin
        $monitor($time, " A=%h, B=%h, MUL RESULT=%h", A, B, f);

//        // Optional: For waveform output
//        $dumpfile("waveform.vcd");
//        $dumpvars(0, parallel_multiplier_tb);

        #5 A = 8'hFF; B = 8'h06;
        #5 B = 8'hCD;
        #5 B = 8'hAA;
        #5 A = 8'h06;
        #5 $finish;
    end
endmodule
