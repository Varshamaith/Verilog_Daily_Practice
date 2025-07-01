//simple test bench to verify the functionality of JK-FF

module tb_jkflipflop;
    reg clk, j, k;
    wire q;

    jk_flipflop uut (.clk(clk), .j(j), .k(k), .q(q));

    initial begin
        clk = 0;
        j = 0; k = 0;
        #10 j = 1; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 1;
        #20 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | clk=%b | j=%b | k=%b | q=%b", $time, clk, j, k, q);
    end
endmodule
