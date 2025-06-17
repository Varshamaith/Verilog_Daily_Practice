//parallel multiplier using structural modeling (ripple carry adder)
module parallel_multiplier(A,B,out);
      parameter n=4;
      input [n-1:0] A;
      input [n-1:0] B;
      output [2*n-1:0] out;
      wire [2*n-1:0] pp0,pp1,pp2,pp3;
      
      assign pp0=(A & {n{B[0]}});
      assign pp1=(A & {n{B[1]}})<<1;
      assign pp2=(A & {n{B[2]}})<<2;
      assign pp3=(A & {n{B[3]}})<<3;
      
      localparam width=2*n;
      wire [width-1:0] sum1,sum2,result;
      wire c1,c2,c3;
      
      //using ripple carry adder to sum the partial sum(pp0,pp1,pp2,pp3)
      ripple_carry_adder #(width) rca1(pp0,pp1,sum1,c1);
      ripple_carry_adder #(width) rca2(sum1,pp2,sum2,c2);
      ripple_carry_adder #(width) rca3(sum2,pp3,result,c3);
      
      assign out=result;
endmodule 

module ripple_carry_adder #(parameter n=4) (a,b,sum,cout);
     input [n-1:0] a;
     input [n-1:0] b;
     output [n-1:0] sum;
     output cout;
     wire [n:0] carry;
     assign carry[0]=0;
     
     genvar i;
     generate
     for (i=0;i<n;i=i+1)
     begin: fa_loop
       fulladder fa(a[i],b[i],carry[i],sum[i],carry[i+1]);
     end
     endgenerate
     
     assign cout=carry[n];
endmodule

//full adder implementation
module fulladder(a,b,cin,sum,cout);
     input a,b,cin;
     output sum,cout;
     
     assign sum=a^b^cin;
     assign cout=(a&b) | (b&cin) | (a&cin);
endmodule
         
             