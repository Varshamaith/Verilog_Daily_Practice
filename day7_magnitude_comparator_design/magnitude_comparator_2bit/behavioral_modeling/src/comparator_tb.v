//testbench to verify the functionality of 2bit magnitude comparator
`timescale 1ns/1ps;

module comparator_tb;
    reg [1:0] A;
    reg [1:0] B;
    wire [2:0] out;
    
    comparator dut(.A(A),
                   .B(B),
                   .out(out));
                   
    initial
    begin
    $monitor ($time, "  A=%b,B=%b,out=%b",A,B,out);
    #0 A=0;B=0;
    #5 A=2'b11;
       B=2'b11;
    #10 A=2'b00;
        B=2'b01;
    #5 A=2'b11;
       B=2'b10;
    #5 B=2'b11;
    #5 A=2'b01;
    #5 $finish;
    end
endmodule