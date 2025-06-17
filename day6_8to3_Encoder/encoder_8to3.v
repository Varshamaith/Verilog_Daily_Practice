//what is encoder:
//An encoder takes multiple input signals (only one active 
//at a time) and encodes the position of the active input into a binary number.

module encoder_8to3 (
    input  [7:0] D,       
    output reg [2:0] Y    // Encoded 3-bit output
);
    always @(*) begin
        case (D)
            8'b00000001: Y = 3'b000;
            8'b00000010: Y = 3'b001;
            8'b00000100: Y = 3'b010;
            8'b00001000: Y = 3'b011;
            8'b00010000: Y = 3'b100;
            8'b00100000: Y = 3'b101;
            8'b01000000: Y = 3'b110;
            8'b10000000: Y = 3'b111;
            default:     Y = 3'bxxx;  // Invalid input(if multiple bits are high)
        endcase
    end
endmodule
