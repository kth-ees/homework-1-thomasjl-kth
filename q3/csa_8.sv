module csa_8 (
  input logic [7:0] a, b,
  output logic [7:0] sum,
  output logic carry
);


logic [3:0] sum_lower;
logic [3:0] sum_upper0;
logic [3:0] sum_upper1;

logic co_lower;
logic co_upper0;
logic co_upper1;

adder_4 lower (
  .A(a[3:0]),
  .B(b[3:0]),
  .carry_in(1'b0),
  .sum(sum_lower),
  .carry_out(co_lower)
);

adder_4 upper0 (
  .A(a[7:4]),
  .B(b[7:4]),
  .carry_in(1'b0),
  .sum(sum_upper0),
  .carry_out(co_upper0)
);

adder_4 upper1 (
  .A(a[7:4]),
  .B(b[7:4]),
  .carry_in(1'b1),
  .sum(sum_upper1),
  .carry_out(co_upper1)
);


assign sum = (co_lower)? ({sum_upper1, sum_lower}):({sum_upper0, sum_lower});
assign carry = (co_lower)? co_upper1:co_upper0;



//assign {carry, sum} = a+b;  //Works




endmodule
