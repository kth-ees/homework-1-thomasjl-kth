module bin2gray_tb;

  // Inputs
  logic [3:0] binary;

  // Outputs
  logic [3:0] gray;

  // complete
  bin2gray dut (
    .binary(binary),
    .gray(gray)
);

  initial begin

    for (int i=0;i<16;i++) begin
      binary = i;
      #10;
    end

  end
endmodule
