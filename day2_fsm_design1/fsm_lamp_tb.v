module fsm_lamp_tb;

reg clk;
wire [0:2] light;

fsm_traffic_controller fsm(clk,light);

always #5 clk=~clk;

initial
   begin
      clk=1'b0;
      #100 $finish;
   end
   
initial
   begin
   $monitor($time,"  RED-GREEN-YELLOW: %b",light);
   end
endmodule