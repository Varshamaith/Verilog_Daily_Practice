//verilog code to implemet the t-ff for positive edge triggered

module t_flipflop (
    input clk,
    input t,
    output reg q=0
);
    always @(posedge clk) begin
        if (t)
            q <= ~q;
    end
endmodule
