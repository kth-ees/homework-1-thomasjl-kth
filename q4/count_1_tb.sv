`timescale 1ns/1ns
module count_1_tb;

  // Inputs
  logic [3:0] a='0;

  // Outputs
  logic [2:0] out;

  // complete

  count_1 dut (.a(a), .out(out));
  initial begin
    for(int i=0;i<16;i++) begin
      a=i;
      #10;
    end
  end
endmodule
