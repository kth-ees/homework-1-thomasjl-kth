module sum_prod #(parameter N) (
  input  wire logic [N-1:0] X [5:0],
  output wire logic [2*N+1:0] result
);

logic [N*2-1:0] intermediate_products [2:0];
logic [N*2:0]   intermediate_sum;

genvar i;
generate
  for (i=0;i<6;i++) begin
    multiply #(N) prod (
      .a(X[i*2]),
      .b(X[i*2+1]),
      .product(intermediate_products[i])
    );
  end
endgenerate

add #(2*N, 2*N) summer1 (
  .A(intermediate_products[0]),
  .B(intermediate_products[1]),
  .sum(intermediate_sum)
);

add #(2*N+1, 2*N) summer2 (
  .A(intermediate_sum),
  .B(intermediate_products[2]),
  .sum(result)
);

endmodule
