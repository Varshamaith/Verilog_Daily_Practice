//simple test bench to verify the functionality of SR-FF

module tb_srflipflop;
    reg clk, s, r;
    wire q;

    sr_flipflop uut (.clk(clk), .s(s), .r(r), .q(q));

    initial begin
        clk = 0;
        s = 0; r = 0;
        #10 s = 1; r = 0;
        #10 s = 0; r = 1;
        #10 s = 1; r = 1; // Invalid state
        #10 s = 0; r = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | clk=%b | s=%b | r=%b | q=%b", $time, clk, s, r, q);
    end
endmodule
