`timescale 1ns/1ns
module multiplier_tb;

  localparam N = 8;

  // complete

  logic [N-1:0] a,b = '0;
  logic [2*N-1:0] product;

  var unsigned int wrong_counter = 0;

  multiplier #(N) dut (
    .a(a),
    .b(b),
    .product(product)
  );

  initial begin
    for(int i=0;i<2**N;i++) begin
      a = i;
      for (int j=0;j<2**N;j++) begin
        b = j;
        check_prod = a * b;
        #10;
        if (check_prod != product) begin
          wrong_counter++;
          $display("i=%d, j=%d, product=%d, check_prod=%d", i, j, product, check_prod);
        end
      end
    end
    $display(wrong_counter);
  end
  
  
endmodule
