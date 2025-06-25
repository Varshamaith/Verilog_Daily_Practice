//verilog code to implement the half_subtractor

module half_subtractor(a,b,diff,borrow);
       input a;
       input b;
       output diff;
       output borrow;
       
       assign diff = a ^ b;         
       assign borrow = (~a) & b;
endmodule