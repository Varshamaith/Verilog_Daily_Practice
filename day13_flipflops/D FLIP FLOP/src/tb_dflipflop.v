module tb_dflipflop;
    reg clk, d;
    wire q;

    d_flipflop uut (.clk(clk), .d(d), .q(q));
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        d = 0;
        #5 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | d=%b | q=%b", $time, clk, d, q);
    end
endmodule
