module binary_to_bcd (
    input [3:0] binary,
    output reg [7:0] bcd_out   // 8-bit output: [tens(7:4), ones(3:0)]
);
    integer i;
    reg [11:0] shift_reg;

    always @(*) begin
        shift_reg = 12'd0;
        shift_reg[3:0] = binary;

        //Shift Add-3 algorithm
        for (i = 0; i < 4; i = i + 1) begin
            if (shift_reg[7:4] >= 5)
                shift_reg[7:4] = shift_reg[7:4] + 3;
            if (shift_reg[11:8] >= 5)
                shift_reg[11:8] = shift_reg[11:8] + 3;

            shift_reg = shift_reg << 1;
        end

        //Combine tens and ones into 8bit BCD
        bcd_out = {shift_reg[11:8], shift_reg[7:4]};
    end
endmodule
