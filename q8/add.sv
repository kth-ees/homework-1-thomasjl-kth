module add #(parameter N, M) (
  input logic [N-1:0] A,
  input logic [M-1:0] B,
  output logic [N:0] sum
);

assign sum = A+B;

endmodule