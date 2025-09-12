module multiply #(parameter N) (
  input  logic [N-1:0] a,
  input  logic [N-1:0] b,
  output logic [2*N-1:0] product
);

assign product = a*b;

endmodule