module multiplexer_16b (
  input logic [3:0] s,
  input logic [15:0] val_in,
  output logic val_out
);

assign val_out = val_in[s];

endmodule

module bin2bcd (
  input logic [3:0] binary,
  output logic [3:0] bcd,
  output logic carry
);

  localparam logic [15:0]  bcd0_lookup = {1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0};
  localparam logic [15:0]  bcd1_lookup = {1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0};
  localparam logic [15:0]  bcd2_lookup = {1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0};
  localparam logic [15:0]  bcd3_lookup = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
  localparam logic [15:0] carry_lookup = {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

  multiplexer_16b bcd0_multiplexer (
    .s(binary),
    .val_in(bcd0_lookup),
    .val_out(bcd[0])
   ); // %2 lol

  multiplexer_16b bcd1_multiplexer (
    .s(binary),
    .val_in(bcd1_lookup),
    .val_out(bcd[1])
   );

  multiplexer_16b bcd2_multiplexer (
    .s(binary),
    .val_in(bcd2_lookup),
    .val_out(bcd[2])
   );

  multiplexer_16b bcd3_multiplexer (
    .s(binary),
    .val_in(bcd3_lookup),
    .val_out(bcd[3])
   );

  multiplexer_16b carry_multiplexer (
    .s(binary),
    .val_in(carry_lookup),
    .val_out(carry)
   ); // >9 lol
  
endmodule
