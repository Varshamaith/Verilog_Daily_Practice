module demux_1to16 (
    input wire din,              
    input wire [3:0] sel,        // select input (log2(16) = 4)
    output reg [15:0] dout       
);

always @(*) begin
    dout = 16'b0; // Default: all outputs low

    case (sel)
        4'd0:  dout[0]  = din;
        4'd1:  dout[1]  = din;
        4'd2:  dout[2]  = din;
        4'd3:  dout[3]  = din;
        4'd4:  dout[4]  = din;
        4'd5:  dout[5]  = din;
        4'd6:  dout[6]  = din;
        4'd7:  dout[7]  = din;
        4'd8:  dout[8]  = din;
        4'd9:  dout[9]  = din;
        4'd10: dout[10] = din;
        4'd11: dout[11] = din;
        4'd12: dout[12] = din;
        4'd13: dout[13] = din;
        4'd14: dout[14] = din;
        4'd15: dout[15] = din;
    endcase
end

endmodule
