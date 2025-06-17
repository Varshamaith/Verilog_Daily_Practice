module parallel_multiplier_tb;
    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] f;
    parallel_multiplier PLM (A, B, f);

    initial begin
    A = 0; B = 0;
    $monitor($time, " A=%d, B=%d, MUL RESULT=%d", A, B, f);

    #5  A = 4'h3; B = 4'h9;
    #5; // allow time for output to settle
    #5  B = 4'hA;
    #5; 
    #5  B = 4'h6;
    #5;
    #5  A = 4'h8;
    #5;
    $finish;
end

endmodule
