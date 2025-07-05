module alu_8bit (
    input [7:0] A, B,
    input [3:0] ALU_Sel,
    output reg [7:0] ALU_Result
);

    always @(*) begin
        case (ALU_Sel)
            4'b0000: ALU_Result = A + B;
            4'b0001: ALU_Result = A - B;
            4'b0010: ALU_Result = A * B;
            4'b0011: ALU_Result = B != 0 ? A / B : 8'b0;
            4'b0100: ALU_Result = A << 1;
            4'b0101: ALU_Result = A >> 1;
            4'b0110: ALU_Result = {A[6:0], A[7]}; // rotate left
            4'b0111: ALU_Result = {A[0], A[7:1]}; // rotate right
            4'b1000: ALU_Result = A & B;
            4'b1001: ALU_Result = A | B;
            4'b1010: ALU_Result = A ^ B;
            4'b1011: ALU_Result = ~(A | B); // NOR
            4'b1100: ALU_Result = ~(A & B); // NAND
            4'b1101: ALU_Result = ~(A ^ B); // XNOR
            4'b1110: ALU_Result = (A > B) ? 8'b1 : 8'b0;
            4'b1111: ALU_Result = (A == B) ? 8'b1 : 8'b0;
            default: ALU_Result = 8'b0;
        endcase
    end
endmodule
