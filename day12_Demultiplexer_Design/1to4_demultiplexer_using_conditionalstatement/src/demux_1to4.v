module demux_1to4 (
    input wire din,           
    input wire [1:0] sel,     
    output reg [3:0] dout     
);

always @(*) begin
    dout = 4'b0000; // Default output is 0

    if (sel == 2'b00)
        dout[0] = din;
    else if (sel == 2'b01)
        dout[1] = din;
    else if (sel == 2'b10)
        dout[2] = din;
    else if (sel == 2'b11)
        dout[3] = din;
end

endmodule
