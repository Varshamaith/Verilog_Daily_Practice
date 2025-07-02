module tb_dlatch;
    reg D, En;
    wire Q;

    // Instantiate the D latch
    d_latch dut (
        .D(D),
        .En(En),
        .Q(Q)
    );

    initial begin
        $monitor("Time=%0t | En=%b D=%b => Q=%b", $time, En, D, Q);

        // Initial values
        D = 0; En = 0;

        #10 D = 1; En = 0; // No change
        #10 D = 1; En = 1; // Q = 1
        #10 D = 0; En = 1; // Q = 0
        #10 En = 0; D = 1; // Q holds
        #10 $finish;
    end
endmodule
