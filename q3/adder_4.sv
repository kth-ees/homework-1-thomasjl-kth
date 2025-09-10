module adder_4 (
  input logic [3:0] A, B,
  input logic carry_in,
  output logic [3:0] sum,
  output logic carry_out
);
  assign {carry_out, sum} = A+B+carry_in;

endmodule