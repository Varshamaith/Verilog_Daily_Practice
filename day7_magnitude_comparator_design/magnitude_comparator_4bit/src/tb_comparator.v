`timescale 1ns/1ps

module tb_comparator;

  reg [3:0] A, B;
  wire A_gt_B, A_eq_B, A_lt_B;

  // Instantiate the module
  comparator dut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );

  initial begin
    $display(" A    B   | A_gt_B A_eq_B A_lt_B");
    $display("-------------------------------");

    A = 4'b0000; B = 4'b0000; #10;
    $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

    A = 4'b1010; B = 4'b1001; #10;
    $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

    A = 4'b0111; B = 4'b1111; #10;
    $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

    A = 4'b1100; B = 4'b1100; #10;
    $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

    A = 4'b1000; B = 4'b0100; #10;
    $display("%b %b |   %b      %b      %b", A, B, A_gt_B, A_eq_B, A_lt_B);

    $finish;
  end

endmodule
