module mux_16to1_tb;

reg [15:0] a;
reg [3:0] s;
wire f;

mux_16to1 tb(.in(a),.sel(s),.out(f));

initial
begin
   $monitor("$time, a=%h, s=%h, f=%h",a,s,f);
   #5 a=16'hfff0; s=4'h7;
   #5 s=4'h0;
   #5 s=4'h3;
   #10 s=4'h5;
   #15 $finish;
end

endmodule;