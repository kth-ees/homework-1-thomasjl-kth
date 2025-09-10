`timescale 1ns/1ns

module bin2bcd_tb;

  // Testbench signals
  logic [3:0] binary = '0;
  logic [3:0] bcd;
  logic carry;

  // complete your tb
  bin2bcd dut (
    .binary(binary),
    .bcd(bcd),
    .carry(carry)
);

  initial begin

    for (int i=0;i<16;i++) begin
      binary = i;
      #10;
    end

  end
	

endmodule
