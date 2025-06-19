//A combinational circuit that checks and verifies the correctness of the transmitted data by analyzing the parity bit is called a parity checker
//even parity checker-verilog code

module parity_checker #(parameter N = 8)(
    input  wire [N-1:0] data_in,
    input  wire parity_bit,
    output wire parity_ok   
);
    assign parity_ok = (^data_in ^ parity_bit); //for odd parity ~(^data_in ^ parity_bit)
endmodule
