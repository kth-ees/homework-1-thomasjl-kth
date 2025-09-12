module multiplier #(parameter N) (
  input  logic [N-1:0]a,b,
  output logic [2*N-1:0] product
);

// complete the module

logic [N-1:0]   pp [N-1:0]; // declare partial products. pp[i] is the product of b[i] with a (rightshifted by i)
logic [N:0] sums [N-1:0];   // declare partial sums. Each row is N+1 bits. The final bit is the carry.

assign sums[0][N-1:0] = pp[0]; // Assign first sum of partial product[0] and 0. 
assign sums[0][N] = 1'b0;      // Assign first carry as 0.

genvar i, j;
generate 
  // Generate AND gates that calculate partial products
  for (i=0;i<N-1;i++) begin
    for (j=0;j<N-1;j++) begin
      assign pp[i][j] = b[i] & a[j];
    end
  end

  
  for (i=1;i<N-1;i++) begin
    N_ripple_adder #(N) adder ( // Generate ripple adders that add upper N bits of last partial sum with current partial product
      .A(pp[i]),
      .B(sums[i-1][N:1]),
      .sum(sums[i])
    );

    assign product[i-1] = sums[i-1][0]; // assign first N-1 bits of product from trailing sums LSBs
  end
endgenerate

assign product[2*N-1:N-1] = sums[N-1]; // assign last N+1 bits of product from final sum

endmodule
