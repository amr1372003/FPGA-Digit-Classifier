`timescale 1ns/1ps

module nn_tb;
    reg clk;

    reg enable_layer_1;
    reg enable_layer_2;
    reg enable_layer_3;

    reg accumulate_en_layer_1;
    reg accumulate_en_layer_2;
    reg accumulate_en_layer_3;

    reg [9:0] addr_mem_layer_1_weights;
    reg [4:0] addr_mem_layer_2_weights;
    reg [3:0] addr_mem_layer_3_weights;

    reg [9:0] addr_mem_data;

    reg read_en_mem_weights;
    reg read_en_mem_data;

    reg enable_argmax;

    wire signed [7:0] output_data;

    nn #(.IMAGE_ID(16)) dut (
        .clk_neuron(clk),

        .enable_layer_1(enable_layer_1),
        .enable_layer_2(enable_layer_2),
        .enable_layer_3(enable_layer_3),

        .accumulate_en_layer_1(accumulate_en_layer_1),
        .accumulate_en_layer_2(accumulate_en_layer_2),
        .accumulate_en_layer_3(accumulate_en_layer_3),

        .addr_mem_layer_1_weights(addr_mem_layer_1_weights),
        .addr_mem_layer_2_weights(addr_mem_layer_2_weights),
        .addr_mem_layer_3_weights(addr_mem_layer_3_weights),

        .addr_mem_data(addr_mem_data),

        .read_en_mem_weights(read_en_mem_weights),
        .read_en_mem_data(read_en_mem_data),

        .enable_argmax(enable_argmax),

        .output_data(output_data)
    );

    always #5 clk = ~clk;

    integer i;

    initial begin
        clk = 0;
        enable_layer_1 = 0;
        enable_layer_2 = 0;
        enable_layer_3 = 0;

        accumulate_en_layer_1 = 0;
        accumulate_en_layer_2 = 0;
        accumulate_en_layer_3 = 0;

        addr_mem_layer_1_weights = 0;
        addr_mem_layer_2_weights = 0;
        addr_mem_layer_3_weights = 0;

        addr_mem_data = 0;

        read_en_mem_weights = 0;
        read_en_mem_data = 0;

        enable_argmax = 0;
        @ (negedge clk);


        enable_layer_1 = 1;
        accumulate_en_layer_1 = 1;
        read_en_mem_weights = 1;
        read_en_mem_data = 1;

        for (i = 0; i < 28*28; i = i + 1) begin
            addr_mem_layer_1_weights = i;
            addr_mem_data = i;
            @ (negedge clk);
        end
        @ (negedge clk);
        accumulate_en_layer_1 = 0;
        enable_layer_1 = 0;
        read_en_mem_data = 0;

        enable_layer_2 = 1;
        accumulate_en_layer_2 = 1;
        for (i = 0; i < 32; i = i + 1) begin
            addr_mem_layer_2_weights = i;
            @ (negedge clk);
        end
        @ (negedge clk);
        accumulate_en_layer_2 = 0;
        enable_layer_2 = 0;

        enable_layer_3 = 1;
        accumulate_en_layer_3 = 1;
        for (i = 0; i < 16; i = i + 1) begin
            addr_mem_layer_3_weights = i;
            @ (negedge clk);
        end
        @ (negedge clk);
        accumulate_en_layer_3 = 0;
        enable_layer_3 = 0;

        enable_argmax = 1;
        repeat(2) @ (negedge clk);
        enable_argmax = 0;
        $display("prediction: %d", output_data);
        $stop;
    end
endmodule