`timescale 1ns/1ps
module combined_tb();
    reg clk;
    reg start;
    reg [9:0] IMAGE_ID;
    reg read_image;
    wire finish;
    wire [7:0] output_data;

    combined dut (
        .clk(clk),
        .start(start),
        .IMAGE_ID(IMAGE_ID),
        .read_image(read_image),
        .finish(finish),
        .output_data(output_data)
    );

    always #5 clk = ~clk;

    integer i;

    initial begin
        for (i = 0; i < 20; i = i + 1) begin
            clk = 0;
            start = 0;
            read_image = 0;
            @(negedge clk);
            IMAGE_ID = i;
            @(negedge clk);
            read_image = 1;
            @(negedge clk);
            read_image = 0;
            start = 1;
            wait (finish);
            @(negedge clk);
            start = 0;
            $display("Output data: %d", output_data);
            // $display("L1 OUTS: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d", dut.nn_inst.neuron_l1_outs[0], dut.nn_inst.neuron_l1_outs[1], dut.nn_inst.neuron_l1_outs[2], dut.nn_inst.neuron_l1_outs[3], dut.nn_inst.neuron_l1_outs[4], dut.nn_inst.neuron_l1_outs[5], dut.nn_inst.neuron_l1_outs[6], dut.nn_inst.neuron_l1_outs[7], dut.nn_inst.neuron_l1_outs[8], dut.nn_inst.neuron_l1_outs[9], dut.nn_inst.neuron_l1_outs[10], dut.nn_inst.neuron_l1_outs[11], dut.nn_inst.neuron_l1_outs[12], dut.nn_inst.neuron_l1_outs[13], dut.nn_inst.neuron_l1_outs[14], dut.nn_inst.neuron_l1_outs[15], dut.nn_inst.neuron_l1_outs[16], dut.nn_inst.neuron_l1_outs[17], dut.nn_inst.neuron_l1_outs[18], dut.nn_inst.neuron_l1_outs[19], dut.nn_inst.neuron_l1_outs[20], dut.nn_inst.neuron_l1_outs[21], dut.nn_inst.neuron_l1_outs[22], dut.nn_inst.neuron_l1_outs[23], dut.nn_inst.neuron_l1_outs[24], dut.nn_inst.neuron_l1_outs[25], dut.nn_inst.neuron_l1_outs[26], dut.nn_inst.neuron_l1_outs[27], dut.nn_inst.neuron_l1_outs[28], dut.nn_inst.neuron_l1_outs[29], dut.nn_inst.neuron_l1_outs[30], dut.nn_inst.neuron_l1_outs[31]);
            // $display("L2 OUTS: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", dut.nn_inst.neuron_l2_outs[0], dut.nn_inst.neuron_l2_outs[1], dut.nn_inst.neuron_l2_outs[2], dut.nn_inst.neuron_l2_outs[3], dut.nn_inst.neuron_l2_outs[4], dut.nn_inst.neuron_l2_outs[5], dut.nn_inst.neuron_l2_outs[6], dut.nn_inst.neuron_l2_outs[7], dut.nn_inst.neuron_l2_outs[8], dut.nn_inst.neuron_l2_outs[9], dut.nn_inst.neuron_l2_outs[10], dut.nn_inst.neuron_l2_outs[11], dut.nn_inst.neuron_l2_outs[12], dut.nn_inst.neuron_l2_outs[13], dut.nn_inst.neuron_l2_outs[14], dut.nn_inst.neuron_l2_outs[15]);
            // $display("L3 OUTS: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", dut.nn_inst.neuron_l3_outs[0], dut.nn_inst.neuron_l3_outs[1], dut.nn_inst.neuron_l3_outs[2], dut.nn_inst.neuron_l3_outs[3], dut.nn_inst.neuron_l3_outs[4], dut.nn_inst.neuron_l3_outs[5], dut.nn_inst.neuron_l3_outs[6], dut.nn_inst.neuron_l3_outs[7], dut.nn_inst.neuron_l3_outs[8], dut.nn_inst.neuron_l3_outs[9]);
        end
        $stop;
    end
endmodule