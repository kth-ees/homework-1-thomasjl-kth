module demultiplexer (
  input logic val_in,
  input logic [3:0] s,
  output logic [15:0] val_out
);

always_comb begin
  val_out = '0;
  val_out[s] = val_in;
end

endmodule


module decoder (
  input logic [3:0] binary,
  output logic [15:0] one_hot
);
  // Add your description here

logic lookup_table = 1'b1; 
  
demultiplexer demux (
  .val_in(lookup_table),
  .s(binary),
  .val_out(one_hot)
);

endmodule