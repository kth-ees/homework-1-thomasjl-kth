module count_1 (
  input logic [3:0] a,
  output logic [2:0] out
);

/*
  always_comb begin
    out = '0;
    for(int i=0;i<4;i++) begin
      out = out+a[i];
    end 
  end
*/
assign out = a[0]+a[1]+a[2]+a[3];

endmodule
