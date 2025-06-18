//verilog code to implement the 2-bit magnitude comparator using dataflow modeling

module comparator (A,B,A_gt_B,A_lt_B,A_eq_B);
     input [1:0] A;
     input [1:0] B;
     output A_gt_B;
     output A_lt_B;
     output A_eq_B;
     
     //comparison using dataflow modeling
     assign A_gt_B=~B[1]&A[1] | ~B[1]&~B[0]&A[0] | A[1]&A[0]&~B[0];
     assign A_lt_B=~A[1]&~A[0]&B[0] | B[1]&B[0]&~A[0] | B[1] & ~A[1];
     assign A_eq_B= ~A[0]&~A[0]&~B[1]&~B[0] | ~A[1]&A[0]&~B[1]&B[0] | A[1]&A[0]&B[1]&B[0] | A[1]&~A[0]&B[1]&~B[0];     
endmodule