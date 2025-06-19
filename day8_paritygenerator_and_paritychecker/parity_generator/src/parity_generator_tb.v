module parity_generator_tb;
    reg [7:0] data;
    wire parity;

    parity_generator #(8) dut (
        .data_in(data),
        .parity_bit(parity)
    );

    initial begin
        $display("Data       Parity");
        $monitor("%b     %b", data, parity);
        data = 8'b00000000; #10  
        data = 8'b00000001; #10 
        data = 8'b11110000; #10 
        data = 8'b10101010; #10 
        data = 8'b11111111; #10 
        $finish;
    end
endmodule
