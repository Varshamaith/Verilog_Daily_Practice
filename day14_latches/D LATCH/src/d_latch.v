module d_latch (
    input D, En,  // En = Enable signal
    output reg Q
);
    always @ (D or En) begin
        if (En)
            Q = D;
    end
endmodule
