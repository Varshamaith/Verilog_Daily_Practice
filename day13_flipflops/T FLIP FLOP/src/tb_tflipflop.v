module tb_tflipflop;
    reg clk, t;
    wire q;

    t_flipflop uut (.clk(clk), .t(t), .q(q));

    initial begin
        clk = 0;
        t = 0;
        #10 t = 1;
        #20 t = 0;
        #10 t = 1;
        #30 $finish;
    end
    always #5 clk = ~clk;
    initial begin
        $monitor("Time=%0t | clk=%b | t=%b | q=%b", $time, clk, t, q);
    end
endmodule
