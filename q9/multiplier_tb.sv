module multiplier_tb;

  // complete
  localparam N = 16;

  logic [N-1:0]   a,b;
  logic [N*2-1:0] product;

  Nbit_mult_using_4 #(N) dut (
    .a(a),
    .b(b),
    .product(product)
  );

  initial begin
    var static int wrong_count = 0; 
    var static int prod_true = 0;
    var static int cycles = 2**(2*N);

    for (int i=0;i<cycles;i++) begin
      a = $urandom;
      b = $urandom;
      prod_true = a*b;
      #5;
      if (prod_true != product) begin
        wrong_count++;
      end
    end
    $display(wrong_count);
  end
  

endmodule
