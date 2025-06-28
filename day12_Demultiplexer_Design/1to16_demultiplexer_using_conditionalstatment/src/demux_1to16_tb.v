module demux_1to16_tb;
    reg din;
    reg [3:0] sel;
    wire [15:0] dout;

    demux_1to16 uut (
        .din(din),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        $monitor("Time=%0t | din=%b sel=%b -> dout=%b", $time, din, sel, dout);
        
        din = 1;
        sel = 4'd0;  #10;
        sel = 4'd5;  #10;
        sel = 4'd10; #10;
        sel = 4'd15; #10;

        din = 0;
        sel = 4'd7;  #10;

        $finish;
    end
endmodule
