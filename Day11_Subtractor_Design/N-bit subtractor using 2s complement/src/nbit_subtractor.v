module nbit_subtractor #(parameter N = 4) (
    input  [N-1:0] a,
    input  [N-1:0] b,
    output [N-1:0] result
);
    assign result = a + (~b + 1);  // A - B using 2's complement
endmodule
