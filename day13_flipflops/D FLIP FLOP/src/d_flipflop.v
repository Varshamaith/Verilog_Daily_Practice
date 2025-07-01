//verilog code to implement the d flip flop with positive edge triggered

module d_flipflop (
    input clk,
    input d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule
