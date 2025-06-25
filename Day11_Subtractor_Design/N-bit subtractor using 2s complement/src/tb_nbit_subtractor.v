module tb_nbit_subtractor;
    reg  [3:0] a, b;
    wire [3:0] result;

    nbit_subtractor #(4) dut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial 
    begin
        $monitor($time, " A=%b B=%b result=%b",a,b,result);
        #10 a = 4'b1010; b = 4'b0011;   
        #10 a = 4'b0100; b = 4'b1000;   
        #10 a = 4'b1010; b = 4'b1111;
        #10 a = 4'b1101; b = 4'b1111;
        
        $finish;
    end
endmodule
