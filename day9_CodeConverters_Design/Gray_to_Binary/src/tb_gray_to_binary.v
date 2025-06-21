//simple testbench to check the functionality of binary to gray code converter

module tb_gray_to_binary;

    reg [3:0] G;
    wire [3:0] B;
    
    //instantiate the design module
    gray_to_binary dut(G,B);
    
    initial
    begin  
       $display("\t\t\t\ttime   Gray   Binary");
       $monitor($time,  "  %b   %b   ",G,B);
       #0 G=4'b0000;
       #5 G=4'b0001;
       #5 G=4'b0011;
       #5 G=4'b0010;
       #5 G=4'b0110;
       #5 G=4'b0111;
       #5 G=4'b0101;
       #5 G=4'b0100;
       #5 G=4'b1100;
       #5 G=4'b1101;
       #5 G=4'b1111;
       #5 G=4'b1110;
       #5 G=4'b1010;
       #5 G=4'b1011;
       #5 G=4'b1001;
       #5 G=4'b1000;
       #10 $finish;
       end
endmodule