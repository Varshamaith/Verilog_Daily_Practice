module parallel_multiplier_tb;
      reg [3:0] A;
      reg [3:0] B;
      wire [7:0] f;
      
      parallel_multiplier PLM(.a(A),.b(B),.out(f));
      initial 
      begin
         $monitor($time, "  A=%h,B=%h,MUL RESULT=%h",A,B,f);
         #5 A=4'h3;B=4'h6;
         #5 B=4'h7;
         #5 B=4'hA;
         #5  A=4'h6;
         #5 $finish;
      end
endmodule