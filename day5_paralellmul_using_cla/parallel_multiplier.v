// 8 bit carry look ahead adder
module CLA_8bit(
    input  [7:0] A,
    input  [7:0] B,
    input  cin,
    output [7:0] sum,
    output cout
);
    wire [7:0] P, G;
    wire [8:0] C;

    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    assign sum = P ^ C[7:0];
    assign cout = C[8];
endmodule

// 16-bit CLA using two 8-bit CLAs
module CLA_16bit(
    input  [15:0] A,
    input  [15:0] B,
    input  cin,
    output [15:0] sum,
    output cout
);
    wire [7:0] sum_low, sum_high;
    wire carry_low, carry_out;

    CLA_8bit cla_low(
        .A(A[7:0]), .B(B[7:0]), .cin(cin),
        .sum(sum_low), .cout(carry_low)
    );

    CLA_8bit cla_high(
        .A(A[15:8]), .B(B[15:8]), .cin(carry_low),
        .sum(sum_high), .cout(carry_out)
    );

    assign sum = {sum_high, sum_low};
    assign cout = carry_out;
endmodule

// 8-bit Parallel Multiplier using CLA
module parallel_multiplier(
    input  [7:0] a,
    input  [7:0] b,
    output [15:0] out
);
    wire [15:0] pp[7:0];
    wire [15:0] s1, s2, s3, s4, s5, s6, final_sum;
    wire c1, c2, c3, c4, c5, c6, cf;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_pp
            assign pp[i] = (a & {8{b[i]}}) << i;
        end
    endgenerate

    CLA_16bit add1(pp[0], pp[1], 1'b0, s1, c1);
    CLA_16bit add2(pp[2], pp[3], 1'b0, s2, c2);
    CLA_16bit add3(pp[4], pp[5], 1'b0, s3, c3);
    CLA_16bit add4(pp[6], pp[7], 1'b0, s4, c4);

    CLA_16bit add5(s1, s2, 1'b0, s5, c5);
    CLA_16bit add6(s3, s4, 1'b0, s6, c6);

    CLA_16bit add7(s5, s6, 1'b0, final_sum, cf);

    assign out = final_sum;
endmodule
