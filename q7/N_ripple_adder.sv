module N_ripple_adder #(parameter N) (
  input logic [N-1:0] A,B,
  output logic [N:0] sum
);
  wire logic [N:0] carries;
  assign carries[0] = 1'0b;
  
  genvar i;
  generate
    for (i=0;i<N;i++) begin : ripple_loop
      full_adder add (
        .a(A[i]),
        .b(B[i]),
        .c_in(carries[i]),
        .c_out(carries[i+1]),
        .s(sum[i])
      );
    end
  endgenerate

  assign sum[N] = carries[N];

endmodule