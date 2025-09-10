`timescale 1ns/1ns
module decoder_tb;

  // Testbench signals
  logic [3:0] binary = '0;
  logic [15:0] one_hot;

  // Instantiate the decoder module
  decoder uut (
    .binary(binary),
    .one_hot(one_hot)
  );

  // Complete your testbench here

initial begin
    #10;
    for (int i=0;i<16;i++) begin
        binary = i;
        #10;
    end
end
endmodule
