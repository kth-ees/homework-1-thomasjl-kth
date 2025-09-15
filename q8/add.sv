module add #(parameter N, M) (
  input logic signed [N-1:0] A,
  input logic signed [M-1:0] B,
  output logic signed [N:0] sum
);

assign sum = A+B;

endmodule