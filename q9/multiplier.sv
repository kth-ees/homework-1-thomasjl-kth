module mult_4bit (
  input logic [3:0] a,b,
  output wire logic [7:0] product
);
  assign product = a*b;
endmodule

// let's experiment with recursion. N must be a power of 2 >= 4 for this to work
module Nbit_mult_using_4 #(parameter N) (
  input logic [N-1:0] a,b,
  output wire logic [2*N-1:0] product
);
// divide a and b into 2 N/2 bit parts each: a1 a0, b1 b0

// define partial products pp[a subindex][b subindex]
/*
 pp[0:1][0:1] = [a0b0 a0b1]
                [a1b0 a1b1]

where aibj is an N bit number
*/
logic [N-1:0] pp [1:0][1:0];

// partial sum sizes get hairy because carries exist
logic [N/2-1:0] S_COL0;      // L00
logic [N/2:0]   S_U00_L10;   // sum of U00 and L10,             N/2+1 bits
logic [N/2+1:0] S_COL1;      // sum of U00,L10,L01,             N/2+2 bits
logic [N/2:0]   S_CARRY_U10; // sum of carry from 1col and U10, N/2+1 bits
logic [N/2+1:0] S_CU10_U01;  // sum of carry,U10,U01,           N/2+2 bits
logic [N/2+2:0] S_COL2;      // sum of carry,U10,U01,L11,       N/2+3 bits
logic [N/2:0]   S_COL3;      // sum of carry and U11,           N/2+1 bits (but we'll pretend the +1 doesn't exist)


// This generate structure handles the recursion and exit condition at N==4 where we call the 4 bit multiplier
genvar i, j;
generate
  for (i=1;i<3;i++) begin
    for (j=1;j<3;j++) begin
      if (N==8) begin
        mult_4bit bottom_multipliers_4bit (
          .a(a[(N/2)*i-1:(N/2)*(i-1)]),
          .b(b[(N/2)*j-1:(N/2)*(j-1)]),
          .product(pp[i-1][j-1])
        );
      end
      else begin
        Nbit_mult_using_4 #(N/2) recursive_multipliers (
          .a(a[(N/2)*i-1:(N/2)*(i-1)]),
          .b(b[(N/2)*j-1:(N/2)*(j-1)]),
          .product(pp[i-1][j-1])
        );
      end
    end
  end
endgenerate

// Assign partial sums - see attached schematic for explanation on terms
assign S_COL0      = pp[0][0][N/2-1:0];
assign S_U00_L10   = pp[0][0][N-1:N/2] + pp[1][0][N/2-1:0];
assign S_COL1      = S_U00_L10         + pp[0][1][N/2-1:0];
assign S_CARRY_U10 = S_COL1[N/2+1:N/2] + pp[1][0][N-1:N/2];
assign S_CU10_U01  = S_CARRY_U10       + pp[0][1][N-1:N/2];
assign S_COL2      = S_CU10_U01        + pp[1][1][N/2-1:0];
assign S_COL3      = S_COL2[N/2+2:N/2] + pp[1][1][N-1:N/2];

// Assign product in quarters of N/2
assign product = {S_COL3[N/2-1:0], S_COL2[N/2-1:0], S_COL1[N/2-1:0],S_COL0};

endmodule

module multiplier (
  input  logic [15:0]a,b,
  output logic [31:0] product
);

endmodule
