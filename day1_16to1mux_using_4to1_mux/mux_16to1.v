module mux_16to1(input [15:0] in, input [3:0] sel, output out);
    wire [3:0] mux4_out;

    mux_4to1 m0 (.in1(in[3:0]),   .sel1(sel[1:0]), .out(mux4_out[0]));
    mux_4to1 m1 (.in1(in[7:4]),   .sel1(sel[1:0]), .out(mux4_out[1]));
    mux_4to1 m2 (.in1(in[11:8]),  .sel1(sel[1:0]), .out(mux4_out[2]));
    mux_4to1 m3 (.in1(in[15:12]), .sel1(sel[1:0]), .out(mux4_out[3]));

    mux_4to1 final_mux (.in1(mux4_out), .sel1(sel[3:2]), .out(out));
endmodule


module mux_4to1(input [3:0] in1, input [1:0] sel1, output out);
    wire mux_low, mux_high;

    mux_2to1 m0 (.in2(in1[1:0]), .sel2(sel1[0]), .out(mux_low));
    mux_2to1 m1 (.in2(in1[3:2]), .sel2(sel1[0]), .out(mux_high));

    mux_2to1 m2 (.in2({mux_high, mux_low}), .sel2(sel1[1]), .out(out));
endmodule


module mux_2to1(input [1:0] in2, input sel2, output out);
    assign out = in2[sel2];
endmodule
