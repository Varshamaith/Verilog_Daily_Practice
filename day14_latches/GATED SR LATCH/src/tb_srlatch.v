module tb_srlatch;
    reg S, R, En;
    wire Q, Qn;

    // Instantiate the gated SR latch
    gated_sr_latch uut (
        .S(S),
        .R(R),
        .En(En),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        $monitor("Time=%0t | En=%b S=%b R=%b => Q=%b Qn=%b", $time, En, S, R, Q, Qn);

        // Initial values
        En = 0; S = 0; R = 0;

        #10 En = 1; S = 1; R = 0;  // Set
        #10 S = 0; R = 1;          // Reset
        #10 S = 0; R = 0;          // Hold
        #10 S = 1; R = 1;          // Invalid
        #10 En = 0; S = 0; R = 0;  // Hold (even on invalid inputs)
        #10 $finish;
    end
endmodule
