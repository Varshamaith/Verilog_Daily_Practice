//verilog code to implement 4-bit magnitude comparator using dataflow modeling

module comparator(
    input [3:0] A,
    input [3:0] B,
    output A_gt_B,
    output A_eq_B,
    output A_lt_B
);

    assign A_gt_B = (A[3] & ~B[3]) |
                    ((A[3] ~^ B[3]) & A[2] & ~B[2]) |
                    ((A[3] ~^ B[3]) & (A[2] ~^ B[2]) & A[1] & ~B[1]) |
                    ((A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] ~^ B[1]) & A[0] & ~B[0]);

    assign A_eq_B = ~(A[3] ^ B[3]) & ~(A[2] ^ B[2]) & ~(A[1] ^ B[1]) & ~(A[0] ^ B[0]);

    assign A_lt_B = (~A[3] & B[3]) |
                    ((A[3] ~^ B[3]) & ~A[2] & B[2]) |
                    ((A[3] ~^ B[3]) & (A[2] ~^ B[2]) & ~A[1] & B[1]) |
                    ((A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] ~^ B[1]) & ~A[0] & B[0]);

endmodule
