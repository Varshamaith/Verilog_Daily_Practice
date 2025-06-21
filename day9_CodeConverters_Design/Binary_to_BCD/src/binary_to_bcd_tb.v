`timescale 1ns / 1ps

module binary_to_bcd_tb;
    // Testbench variables
    reg [3:0] binary;
    wire [7:0] bcd_out;

    // Instantiate the DUT (Device Under Test)
    binary_to_bcd dut (
        .binary(binary),
        .bcd_out(bcd_out)
    );

    integer i;

    initial begin
        $display("Time\tBinary\tBCD (Tens Ones)\tDecimal");
        $display("----------------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            binary = i;
            #10; // wait 10ns for output to stabilize
            $display("%0dns\t%b\t%04b %04b\t%d", 
                      $time, binary, bcd_out[7:4], bcd_out[3:0], i);
        end

        $finish;
    end
endmodule
