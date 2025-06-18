`timescale 1ns/1ps

module comparator_tb;

  reg [1:0] A, B;
  wire A_gt_B, A_eq_B, A_lt_B;

  // Instantiate the comparator
  comparator uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );

  initial begin
    $display("A  B  | A_gt_B A_eq_B A_lt_B");
    $display("----------------------------");

    // Apply all combinations of A and B
    for (integer i = 0; i < 4; i = i + 1) begin
      for (integer j = 0; j < 4; j = j + 1) begin
        A = i;
        B = j;
        #10; // Wait 10 ns
        $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);
      end
    end

    $finish;
  end

endmodule
