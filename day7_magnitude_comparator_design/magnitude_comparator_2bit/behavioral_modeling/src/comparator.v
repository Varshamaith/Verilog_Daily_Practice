//verilog code to implement the 2-bit comparator using behaviorial modeling

module comparator(A,B,out);
      input [1:0] A;
      input [1:0] B;
      output reg [2:0] out;  // out[2] = A > B, out[1] = A == B, out[0] = A < B
      
      
      //comparison using behaviorial modeling
      always @(*)
      begin
         if (A>B)
             out=3'b100;
         else if (A<B)
             out=3'b010;
         else 
             out=3'b001;
      end
endmodule