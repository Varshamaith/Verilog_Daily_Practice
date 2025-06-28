module demux_1to16 (
    input wire din,             
    input wire [3:0] sel,        // 4-bit select input
    output reg [15:0] dout       // 16 output lines
);

always @(*) begin
    dout = 16'b0; // Default: all outputs low

    if (sel == 4'd0)      dout[0]  = din;
    else if (sel == 4'd1) dout[1]  = din;
    else if (sel == 4'd2) dout[2]  = din;
    else if (sel == 4'd3) dout[3]  = din;
    else if (sel == 4'd4) dout[4]  = din;
    else if (sel == 4'd5) dout[5]  = din;
    else if (sel == 4'd6) dout[6]  = din;
    else if (sel == 4'd7) dout[7]  = din;
    else if (sel == 4'd8) dout[8]  = din;
    else if (sel == 4'd9) dout[9]  = din;
    else if (sel == 4'd10) dout[10] = din;
    else if (sel == 4'd11) dout[11] = din;
    else if (sel == 4'd12) dout[12] = din;
    else if (sel == 4'd13) dout[13] = din;
    else if (sel == 4'd14) dout[14] = din;
    else if (sel == 4'd15) dout[15] = din;
end

endmodule
