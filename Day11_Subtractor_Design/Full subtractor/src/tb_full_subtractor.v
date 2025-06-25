//simple test bench to verify the functionality of half-subtractor

module tb_full_subtractor;
     reg a,b,bin;
     wire diff,bout;
     
     //Instantiate the design module
     full_subtractor dut(a,b,bin,diff,bout);
     
     initial
     begin
     $monitor($time , " A=%b B=%b Bin=%b Difference=%b Bout=%b",a,b,bin,diff,bout);
     
     #5 a=1'b0;b=1'b0;bin=1'b0;
     #5 a=1'b0;b=1'b0;bin=1'b1;
     #5 a=1'b0;b=1'b1;bin=1'b0;
     #5 a=1'b0;b=1'b1;bin=1'b1;
     #5 a=1'b1;b=1'b0;bin=1'b0;
     #5 a=1'b1;b=1'b0;bin=1'b1;
     #5 a=1'b1;b=1'b1;bin=1'b0;
     #5 a=1'b1;b=1'b1;bin=1'b1;
     
     
     #10 $finish;
     end
endmodule
     
