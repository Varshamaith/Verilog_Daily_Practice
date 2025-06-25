//simple test bench to verify the functionality of half-subtractor

module tb_half_subtractor;
     reg a,b;
     wire diff,borrow;
     
     //Instantiate the design module
     half_subtractor dut(a,b,diff,borrow);
     
     initial
     begin
     $monitor($time , " A=%b B=%b Difference=%b Borrow=%b",a,b,diff,borrow);
     
     #5 a=1'b0;b=1'b0;
     #5 b=1'b1;
     #5 a=1'b1;b=1'b0;
     #5 b=1'b1;
     
     #10 $finish;
     end
endmodule
     
