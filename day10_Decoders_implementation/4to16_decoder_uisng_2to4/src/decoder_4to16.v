module decoder_4to16 (
    input [3:0] in,
    output [15:0] out
);
    wire [3:0] en;                // Enable lines from first 2:4 decoder
    wire [3:0] d0, d1, d2, d3;    // Outputs from second-stage decoders

    // First stage: MSBs to enable decoder
    decoder_2to4 stage1 (
        .in(in[3:2]),
        .en(1'b1),
        .out(en)
    );

    // Second stage: LSBs to all, enabled one at a time
    decoder_2to4 stage2_0 (.in(in[1:0]), .en(en[0]), .out(d0));
    decoder_2to4 stage2_1 (.in(in[1:0]), .en(en[1]), .out(d1));
    decoder_2to4 stage2_2 (.in(in[1:0]), .en(en[2]), .out(d2));
    decoder_2to4 stage2_3 (.in(in[1:0]), .en(en[3]), .out(d3));

    // Concatenate outputs
    assign out = {d3, d2, d1, d0};

endmodule

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
