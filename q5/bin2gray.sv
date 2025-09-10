module multiplexer_16b (
  input logic [3:0] s,
  input logic [15:0] val_in,
  output logic val_out
);

assign val_out = val_in[s];

endmodule

module bin2gray (
  input logic [3:0] binary,
  output logic [3:0] gray
);
  
  localparam logic [15:0]  gray0_lookup = 16'b0110011001100110;
  localparam logic [15:0]  gray1_lookup = 16'b0011110000111100;
  localparam logic [15:0]  gray2_lookup = 16'b0000111111110000;
  localparam logic [15:0]  gray3_lookup = 16'b1111111100000000;

  multiplexer_16b gray0_multiplexer (
    .s(binary),
    .val_in(gray0_lookup),
    .val_out(gray[0])
   );

  multiplexer_16b gray1_multiplexer (
    .s(binary),
    .val_in(gray1_lookup),
    .val_out(gray[1])
   );

  multiplexer_16b gray2_multiplexer (
    .s(binary),
    .val_in(gray2_lookup),
    .val_out(gray[2])
   );

  multiplexer_16b gray3_multiplexer (
    .s(binary),
    .val_in(gray3_lookup),
    .val_out(gray[3])
   );

endmodule
