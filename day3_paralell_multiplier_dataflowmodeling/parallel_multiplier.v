module parallel_multiplier(a,b,out);
      parameter n=4;
      input [n-1:0] a;
      input [n-1:0] b;
      output [2*n-1:0] out;
      wire [2*n-1:0] pp0,pp1,pp2,pp3;
      assign pp0= (a&{n{b[0]}});
      assign pp1= (a&{n{b[1]}})<<1;
      assign pp2= (a&{n{b[2]}})<<2;
      assign pp3= (a&{n{b[3]}})<<3;
      
      assign out=pp0+pp1+pp2+pp3;     
endmodule