module sum_prod_tb;

  // complete the testbench
  localparam N = 4;
  logic signed [N-1:0] X [5:0];
  logic signed [2*N+1:0] result;
  logic signed [2*N+1:0] prod_true;

  sum_prod #(N) dut (
    .X(X),
    .result(result)
  );

  initial begin
    var static int wrong_count = 0; // passes on N=5. anything higher than that isn't feasible to test in the ultraloop. 
    var static int cycles = 2**N;

    for (int i=0;i<cycles;i++) begin // ultraloop
      X[0] = i;
      for (int j=0;j<cycles;j++) begin
        X[1] = j;
        for (int k=0;k<cycles;k++) begin
          X[2] = k;
          for (int l=0;l<cycles;l++) begin
            X[3] = l;
            for (int m=0;m<cycles;m++) begin
              X[4] = m;
              for (int n=0;n<cycles;n++) begin
                X[5] = n;
                prod_true = (X[0]*X[1])+(X[2]*X[3])+(X[4]*X[5]);
                #5;
                if (prod_true != result) begin
                  wrong_count++;
                end
              end
            end
          end
        end
      end
    end
    $display(wrong_count);
  end


endmodule
