module parity_generator #(parameter N = 8) (  
    input  wire [N-1:0] data_in,              //N bits of input
    output wire parity_bit                    //parity bit                   
);

    assign parity_bit = ^data_in;             // Even parity means xor each bits, odd parity means xnor each bit
    
endmodule
