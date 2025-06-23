module decoder_3to8 (
    input [2:0] in,
    output [7:0] out
);
    wire [3:0] lower_out, upper_out;
    wire en0, en1;

    assign en0 = ~in[2];  // enable lower 2:4 decoder when MSB is 0
    assign en1 =  in[2];  // enable upper 2:4 decoder when MSB is 1

    decoder_2to4 d0 (
        .in(in[1:0]),
        .en(en0),
        .out(lower_out)
    );

    decoder_2to4 d1 (
        .in(in[1:0]),
        .en(en1),
        .out(upper_out)
    );

    assign out = {upper_out, lower_out};  // Concatenate outputs
endmodule


//2to4 decoder module
module decoder_2to4 (
    input [1:0] in,
    input en,
    output reg [3:0] out
);
    always @(*) begin
        if (en) begin
            case (in)
                2'b00: out = 4'b0001;
                2'b01: out = 4'b0010;
                2'b10: out = 4'b0100;
                2'b11: out = 4'b1000;
            endcase
        end else begin
            out = 4'b0000;
        end
    end
endmodule
