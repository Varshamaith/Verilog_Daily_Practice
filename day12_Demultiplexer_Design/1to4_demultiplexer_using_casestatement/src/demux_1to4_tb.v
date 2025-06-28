//simple test bench to verify the functionality of 1to4 demultiplexer

module demux_1to4_tb;
    reg din;
    reg [1:0] sel;
    wire [3:0] dout;

    demux_1to4 dut (
        .din(din),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        $monitor("Time=%0t | din=%b sel=%b -> dout=%b", $time, din, sel, dout);
        
        din = 1; sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        
        din = 0; sel = 2'b10; #10;
        $finish;
    end
endmodule
