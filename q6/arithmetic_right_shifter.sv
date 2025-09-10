module three_bit_multiplexer (
    input logic [3:0] inputs,
    input logic[1:0] s,
    output logic out
);
    assign out = inputs[s];

endmodule

module arithmetic_right_shifter #(parameter N) (
  input logic [N-1:0] input_data,
  input logic [1:0] control,
  output logic [N-1:0] shifted_result
);

  genvar i;
  generate 
    for(i=0;i<N-3;i++) begin
        three_bit_multiplexer n3t1 (
            .inputs(input_data[i+3:i]),
            .s(control),
            .out(shifted_result[i])
            );
    end
  endgenerate

three_bit_multiplexer Nminus3 (
        .inputs({input_data[N-1], input_data[N-1], input_data[N-2], input_data[N-3]}),
        .s(control),
        .out(shifted_result[N-3])
        );

three_bit_multiplexer Nminus2 (
        .inputs({input_data[N-1], input_data[N-1], input_data[N-1], input_data[N-2]}),
        .s(control),
        .out(shifted_result[N-2])
        );

assign shifted_result[N-1] = input_data[N-1];

endmodule

module arithmetic_right_shifter_checker #(parameter N) (
  input logic signed [N-1:0] input_data,
  input logic [1:0] control,
  output logic signed [N-1:0] shifted_result
);

  assign shifted_result = input_data >>> control;

endmodule
