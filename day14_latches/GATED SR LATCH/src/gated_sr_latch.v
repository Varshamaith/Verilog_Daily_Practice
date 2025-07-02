module gated_sr_latch (
    input S, R, En,
    output reg Q, Qn
);
    always @ (S or R or En) begin
        if (En) begin
            if (S & ~R) begin Q = 1; Qn = 0; end
            else if (~S & R) begin Q = 0; Qn = 1; end
            else if (~S & ~R) begin Q = Q; Qn = Qn; end
            else begin Q = 1'bx; Qn = 1'bx; end // invalid state
        end
    end
endmodule
