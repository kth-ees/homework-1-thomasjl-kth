module arithmetic_right_shifter_tb;

    localparam N = 8;

    // complete
    // Inputs
    logic signed [N-1:0] input_data;
    logic [1:0]   control;
    logic signed [N-1:0] shifted_result_mine;
    logic signed [N-1:0] shifted_result_correct;

    arithmetic_right_shifter #(N) dut (
        .input_data(input_data),
        .control(control),
        .shifted_result(shifted_result_mine)
    );

    arithmetic_right_shifter_checker #(N) absolute_truth (
        .input_data(input_data),
        .control(control),
        .shifted_result(shifted_result_correct)
    );

    initial begin
        static int wrong_counter = 0;
        for(int j=-2**(N-1)+1;j<2**(N-1);j++)begin
            input_data = j;
            for (int i=0;i<4;i++)begin
                control = i;
		#10;
                if(shifted_result_mine != shifted_result_correct)begin
                    wrong_counter++;
                    $display(i,j);
                end
            end
        end
        $display(wrong_counter);
    end


endmodule
