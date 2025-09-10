`timescale 1ns/1ns
module csa_8_tb;

  // Inputs
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] sum;
  logic carry;

  // complete

csa_8 dut (
  .a(a),
  .b(b),
  .sum(sum),
  .carry(carry)
);

 int test_a [0:15] = { 8'd0, 8'd15, 8'd15,8'd15, 8'd128, 8'd128, 8'd255, 8'd25,  8'd3, 8'd200, 8'd5, 8'd17,  8'd71, 8'd135,8'd0,8'd0};
 int test_b [0:15] = { 8'd0, 8'd14, 8'd15, 8'd1, 8'd127, 8'd128,   8'd1,  8'd3, 8'd25, 8'd200, 8'd5, 8'd17, 8'd136, 8'd121,8'd0,8'd0};

initial begin

for (int i=0;i<16;i++) begin
  a = test_a[i];
  b = test_b[i];
  //$display(a,b, i);
  #10;
end

end
  
endmodule
