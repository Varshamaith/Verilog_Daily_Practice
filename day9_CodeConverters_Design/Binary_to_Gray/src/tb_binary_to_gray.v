//simple testbench to check the functionality of binary to gray code converter

module tb_binary_to_gray;

    reg [3:0] B;
    wire [3:0] G;
    
    //instantiate the design module
    binary_to_gray dut(B,G);
    
    initial
    begin  
       $display("\t\t\t\ttime   Binary   Gray");
       $monitor($time,  "  %b   %b   ",B,G);
       #0 B=4'b0000;
       #5 B=4'b0001;
       #5 B=4'b0010;
       #5 B=4'b0011;
       #5 B=4'b0100;
       #5 B=4'b0101;
       #5 B=4'b0110;
       #5 B=4'b0111;
       #5 B=4'b1000;
       #5 B=4'b1001;
       #5 B=4'b1010;
       #5 B=4'b1011;
       #5 B=4'b1100;
       #5 B=4'b1101;
       #5 B=4'b1110;
       #5 B=4'b1111;
       #10 $finish;
       end
endmodule