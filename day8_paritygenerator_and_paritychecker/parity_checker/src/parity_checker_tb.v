module parity_checker_tb;
    reg  [7:0] data;
    reg   parity;
    wire  ok;

    parity_checker #(8) uut (
        .data_in(data),
        .parity_bit(parity),
        .parity_ok(ok)
    );

    initial begin
        $display("Data       Parity   Result");
        $monitor("%b     %b       %b", data, parity, ok); 
        data = 8'b00000000; parity = 0; #10 
        data = 8'b00000001; parity = 1; #10  
        data = 8'b00000001; parity = 0; #10 
        data = 8'b11110000; parity = 0; #10 
        data = 8'b11110000; parity = 1; #10 
        $finish;
    end
endmodule
