// Wallace Tree 4x4 Multiplier 

module parallel_multiplier(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);
    wire [3:0] pp0, pp1, pp2, pp3;
    wire [7:0] p;

    // Step 1: Generate Partial Products
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    //sum using wallce tree
    //stage 1:
    wire s11,c11,s12,c12,s13,c13,s14,c14,s15,c15;
    half_adder ha0(pp0[1],pp1[0],s11,c11);
    full_adder fa0(pp0[2],pp1[1],pp2[0],s12,c12);
    full_adder fa1(pp0[3],pp1[2],pp2[1],s13,c13);
    half_adder ha1(pp1[3],pp2[2],s14,c14);
    half_adder ha2(pp2[3],pp3[2],s15,c15);
    
    //stage 2:
    wire s21,c21,s22,c22,s23,c23,s24,c24,s25,c25;
    half_adder ha3(c11,s12,s21,c21);
    full_adder fa3(pp3[0],c12,s13,s22,c22);
    full_adder fa4(pp3[1],c13,s14,s23,c23);
    half_adder ha4(c14,s15,s24,c24);
    half_adder ha5(pp3[3],c15,s25,c25);
    
    //after reduction of two rows calculating the sum
    wire [7:0] sum1,sum2;
    assign sum1 = {1'b0, c24, c23, c22, c21, 3'b000};
    assign sum2 = {c25, s25, s24, s23, s22, s21, s11, pp0[0]};
    assign P = sum1 + sum2;

endmodule

// half Adder Module
module half_adder(input a, input b, output sum, output carry);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// full Adder Module
module full_adder(input a, input b, input cin, output sum, output carry);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule
