module multiplier #(parameter N) (
  input  logic [N-1:0] a,
  input  logic [N-1:0] b,
  output logic [2*N-1:0] product
);

// complete the module

logic [N-1:0]   pp   [N-1:0]; // declare partial products. pp[i] is the product of b[i] with a (rightshifted by i)
logic [2*N-1:0] sums [N-1:0];   // declare partial sums. Each row is 2*N bits to handle sign extension

assign sums[0] = {{N{pp[0][N-1]}}, pp[0]}; // initialize first row of sums using sign extension

genvar i, j, k;
generate 
  // Generate AND gates that calculate partial products
  for (i=0;i<N;i++) begin
    for (j=0;j<N;j++) begin
      assign pp[i][j] = b[i] & a[j];
    end
  end

  
  for (k=1;k<N-1;k++) begin // loop up to second last element, which will be subtraction instead of adding
    N_ripple_adder #(2*N-k) adder ( // Generate ripple adders that add 2N-k bits of last partial sum with current partial product
      .A({{(N-k){pp[k][N-1]}},pp[k]}), // sign extended partial product
      .B(sums[k-1][2*N-1:k]),
      .carry_in(1'b0),
      .sum(sums[k][2*N-1:k])
    );
    assign product[k-1] = sums[k-1][k-1]; // assign first N-1 bits of product from trailing sums LSBs
  end
endgenerate

assign product[N-2] = sums[N-2][N-2];

N_ripple_adder #(N+1) subtractor ( // Generate last ripple adder for subtraction
  .A(~{{pp[N-1][N-1]},pp[N-1]}),  
  .B(sums[N-2][2*N-1:N-1]),
  .carry_in(1'b1),
  .sum(sums[N-1][2*N-1:N-1])
);

assign product[2*N-1:N-1] = sums[N-1][2*N-1:N-1]; // assign last N+1 bits of product from final sum

endmodule
