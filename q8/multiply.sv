module multiply #(parameter N) (
  input  logic signed [N-1:0] a,
  input  logic signed [N-1:0] b,
  output logic signed [2*N-1:0] product
);

assign product = a*b;

endmodule