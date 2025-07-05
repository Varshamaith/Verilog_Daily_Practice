`timescale 1ns/1ps

module tb_alu_8bit;
    reg [7:0] A, B;
    reg [3:0] ALU_Sel;
    wire [7:0] ALU_Result;

    // Instantiate the ALU design module
    alu_8bit dut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Result(ALU_Result)
    );

    initial begin
        $monitor("Time = %0t | A = %h, B = %h, ALU_Sel = %b => ALU_Result = %h", 
                  $time, A, B, ALU_Sel, ALU_Result);

        A = 8'h0A; B = 8'h03;

        ALU_Sel = 4'b0000; #10; // A + B
        ALU_Sel = 4'b0001; #10; // A - B
        ALU_Sel = 4'b0010; #10; // A * B
        ALU_Sel = 4'b0011; #10; // A / B
        ALU_Sel = 4'b0100; #10; // A << 1
        ALU_Sel = 4'b0101; #10; // A >> 1
        ALU_Sel = 4'b0110; #10; // Rotate left
        ALU_Sel = 4'b0111; #10; // Rotate right
        ALU_Sel = 4'b1000; #10; // A & B
        ALU_Sel = 4'b1001; #10; // A | B
        ALU_Sel = 4'b1010; #10; // A ^ B
        ALU_Sel = 4'b1011; #10; // A NOR B
        ALU_Sel = 4'b1100; #10; // A NAND B
        ALU_Sel = 4'b1101; #10; // A XNOR B
        ALU_Sel = 4'b1110; #10; // A > B
        ALU_Sel = 4'b1111; #10; // A == B

        #10 $finish;
    end

endmodule
