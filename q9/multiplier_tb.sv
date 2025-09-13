`timescale 1ns/1ns
module multiplier_tb;

  // complete
  localparam N = 16;

  logic [N-1:0]   a,b;
  logic [N*2-1:0] product;
  logic [N*2-1:0] prod_true;

  Nbit_mult_using_4 #(N) dut (
    .a(a),
    .b(b),
    .product(product)
  );

  initial begin
    var static int     wrong_count = 0; 
    var static int     cycles = 2**16;

    for (int i=0;i<cycles;i++) begin
      a = $urandom; //{$urandom, $urandom}; <- need this if you test N=64
      b = $urandom; //{$urandom, $urandom};
      prod_true = a*b;
      #5;
      if (prod_true != product) begin
        wrong_count++;
      end
    end
    $display(wrong_count);
  end
  

endmodule
