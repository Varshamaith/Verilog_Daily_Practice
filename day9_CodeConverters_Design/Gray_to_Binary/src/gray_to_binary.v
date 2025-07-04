//verilog code to implement code converter - Gray code to Binary code

module gray_to_binary(G,B);
      input [3:0] G;
      output [3:0] B;
      
      //Logic to convert the Gray code to Binary code
      assign B[3]=G[3];
      assign B[2]=B[3]^G[2];
      assign B[1]=B[2]^G[1];
      assign B[0]=B[1]^G[0];
      
endmodule