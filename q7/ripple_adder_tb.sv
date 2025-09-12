`timescale 1ns/1ns
module ripple_adder_tb;

  localparam N = 6;
  logic [N-1:0] A,B;
  logic carry_in, carry_out;
  logic [N-1:0] sum;

  // complete
  N_ripple_adder #(N) dut(
    .A(A), .B(B),
    .carry_in(carry_in), .carry_out(carry_out),
    .sum(sum)
  );

  initial begin
    var static int wrong_counter = 0;
    var static int check_sum = 0;
    carry_in = 1'b0;
    for (int i=0;i<2**N;i++) begin
        A = i;
        for (int j=0;j<2**N;j++) begin
            check_sum = i+j;
            if (check_sum < 2**N) begin
                B = j;
                #10;
                if (sum != check_sum) begin
                    wrong_counter++;
                    $display("i=%d, j=%d, sum=%d, check_sum=%d", i,j,sum, check_sum);
                end
            end
         end
    end
    $display(wrong_counter);
  end
  
  
endmodule