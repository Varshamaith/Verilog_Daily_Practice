module mux_16to1_tb;

reg [15:0] a;
reg [3:0] sel;
wire F;

mux_16to1 tb(.in(a),.sel(sel),.out(F));

initial
begin 
   $monitor("$time,a=%h, sel=%h,F=%b",a,sel,F);
   
   #5 a=16'h3f0a; sel=4'h0;
   #10 a=16'h1;sel=4'h1;
   #5 sel=4'h6;
   #5 sel=4'h8;
   #10 sel=4'hc;
   #5 $finish;
end
endmodule