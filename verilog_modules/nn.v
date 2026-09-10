module nn #(
    parameter  M0_l1 = 1930144863,
    parameter  SHIFT_l1 = 43,
    parameter  IN_ZP_l1 = 17,
    parameter  OUT_ZP_l1 = 69,

    parameter  M0_l2 = 1231765115,
    parameter  SHIFT_l2 = 37,
    parameter  IN_ZP_l2 = 69,
    parameter  OUT_ZP_l2 = 70,

    parameter  M0_l3 = 1903464711,
    parameter  SHIFT_l3 = 38,
    parameter  IN_ZP_l3 = 70,
    parameter  OUT_ZP_l3 = 78
    ) (
    input wire clk_neuron,
    input wire [9:0] IMAGE_ID,
    input wire read_image,

    input wire enable_layer_1,
    input wire enable_layer_2,
    input wire enable_layer_3,

    input wire accumulate_en_layer_1,
    input wire accumulate_en_layer_2,
    input wire accumulate_en_layer_3,

    input wire [9:0] addr_mem_layer_1_weights,
    input wire [4:0] addr_mem_layer_2_weights,
    input wire [3:0] addr_mem_layer_3_weights,
    input wire [9:0] addr_mem_data,

    input wire read_en_mem_weights,
    input wire read_en_mem_data,

    input wire enable_argmax,
    
    output wire signed [7:0] output_data
);

    wire signed [31:0] bias_layer_1 [0:31];
    wire signed [31:0] bias_layer_2 [0:15];
    wire signed [31:0] bias_layer_3 [0:9];

    wire [7:0] w_layer1 [0:31];
    wire [7:0] w_layer2 [0:15];
    wire [7:0] w_layer3 [0:9];

    wire signed [7 : 0] neuron_l1_outs [0 : 31];
    wire signed [7 : 0] neuron_l2_outs [0 : 15];
    wire signed [7 : 0] neuron_l3_outs [0 : 9];

    wire [7 : 0] data_out_mem;

    mem #(
        .DEPTH(784),
        .LAYER_ID(0),
        .data_width(8),
        .MEM_ID(0)
    ) DATA_MEMORY (
        .clk_mem(clk_neuron),
        .IMAGE_ID(IMAGE_ID),
        .read_image(read_image),
        .enable_mem(enable_layer_1),
        .read_mem(read_en_mem_data),
        .addr_mem(addr_mem_data),
        .data_out_mem(data_out_mem)
    );

    full_mem full_mem_inst (
        .clk_mem(clk_neuron),
        .read_en_mem(read_en_mem_weights),
        .enable_mem_layer_1(enable_layer_1),
        .enable_mem_layer_2(enable_layer_2),
        .enable_mem_layer_3(enable_layer_3),

        .addr_mem_layer_1_weights(addr_mem_layer_1_weights),
        .addr_mem_layer_2_weights(addr_mem_layer_2_weights),
        .addr_mem_layer_3_weights(addr_mem_layer_3_weights),

        .data_out_mem_layer_1_n0_weights(w_layer1[0]),
        .data_out_mem_layer_1_n1_weights(w_layer1[1]),
        .data_out_mem_layer_1_n2_weights(w_layer1[2]),
        .data_out_mem_layer_1_n3_weights(w_layer1[3]),
        .data_out_mem_layer_1_n4_weights(w_layer1[4]),
        .data_out_mem_layer_1_n5_weights(w_layer1[5]),
        .data_out_mem_layer_1_n6_weights(w_layer1[6]),
        .data_out_mem_layer_1_n7_weights(w_layer1[7]),
        .data_out_mem_layer_1_n8_weights(w_layer1[8]),
        .data_out_mem_layer_1_n9_weights(w_layer1[9]),
        .data_out_mem_layer_1_n10_weights(w_layer1[10]),
        .data_out_mem_layer_1_n11_weights(w_layer1[11]),
        .data_out_mem_layer_1_n12_weights(w_layer1[12]),
        .data_out_mem_layer_1_n13_weights(w_layer1[13]),
        .data_out_mem_layer_1_n14_weights(w_layer1[14]),
        .data_out_mem_layer_1_n15_weights(w_layer1[15]),
        .data_out_mem_layer_1_n16_weights(w_layer1[16]),
        .data_out_mem_layer_1_n17_weights(w_layer1[17]),
        .data_out_mem_layer_1_n18_weights(w_layer1[18]),
        .data_out_mem_layer_1_n19_weights(w_layer1[19]),
        .data_out_mem_layer_1_n20_weights(w_layer1[20]),
        .data_out_mem_layer_1_n21_weights(w_layer1[21]),
        .data_out_mem_layer_1_n22_weights(w_layer1[22]),
        .data_out_mem_layer_1_n23_weights(w_layer1[23]),
        .data_out_mem_layer_1_n24_weights(w_layer1[24]),
        .data_out_mem_layer_1_n25_weights(w_layer1[25]),
        .data_out_mem_layer_1_n26_weights(w_layer1[26]),
        .data_out_mem_layer_1_n27_weights(w_layer1[27]),
        .data_out_mem_layer_1_n28_weights(w_layer1[28]),
        .data_out_mem_layer_1_n29_weights(w_layer1[29]),
        .data_out_mem_layer_1_n30_weights(w_layer1[30]),
        .data_out_mem_layer_1_n31_weights(w_layer1[31]),

        .data_out_mem_layer_1_n0_bias(bias_layer_1[0]),
        .data_out_mem_layer_1_n1_bias(bias_layer_1[1]),
        .data_out_mem_layer_1_n2_bias(bias_layer_1[2]),
        .data_out_mem_layer_1_n3_bias(bias_layer_1[3]),
        .data_out_mem_layer_1_n4_bias(bias_layer_1[4]),
        .data_out_mem_layer_1_n5_bias(bias_layer_1[5]),
        .data_out_mem_layer_1_n6_bias(bias_layer_1[6]),
        .data_out_mem_layer_1_n7_bias(bias_layer_1[7]),
        .data_out_mem_layer_1_n8_bias(bias_layer_1[8]),
        .data_out_mem_layer_1_n9_bias(bias_layer_1[9]),
        .data_out_mem_layer_1_n10_bias(bias_layer_1[10]),
        .data_out_mem_layer_1_n11_bias(bias_layer_1[11]),
        .data_out_mem_layer_1_n12_bias(bias_layer_1[12]),
        .data_out_mem_layer_1_n13_bias(bias_layer_1[13]),
        .data_out_mem_layer_1_n14_bias(bias_layer_1[14]),
        .data_out_mem_layer_1_n15_bias(bias_layer_1[15]),
        .data_out_mem_layer_1_n16_bias(bias_layer_1[16]),
        .data_out_mem_layer_1_n17_bias(bias_layer_1[17]),
        .data_out_mem_layer_1_n18_bias(bias_layer_1[18]),
        .data_out_mem_layer_1_n19_bias(bias_layer_1[19]),
        .data_out_mem_layer_1_n20_bias(bias_layer_1[20]),
        .data_out_mem_layer_1_n21_bias(bias_layer_1[21]),
        .data_out_mem_layer_1_n22_bias(bias_layer_1[22]),
        .data_out_mem_layer_1_n23_bias(bias_layer_1[23]),
        .data_out_mem_layer_1_n24_bias(bias_layer_1[24]),
        .data_out_mem_layer_1_n25_bias(bias_layer_1[25]),
        .data_out_mem_layer_1_n26_bias(bias_layer_1[26]),
        .data_out_mem_layer_1_n27_bias(bias_layer_1[27]),
        .data_out_mem_layer_1_n28_bias(bias_layer_1[28]),
        .data_out_mem_layer_1_n29_bias(bias_layer_1[29]),
        .data_out_mem_layer_1_n30_bias(bias_layer_1[30]),
        .data_out_mem_layer_1_n31_bias(bias_layer_1[31]),


        .data_out_mem_layer_2_n0_weights(w_layer2[0]),
        .data_out_mem_layer_2_n1_weights(w_layer2[1]),
        .data_out_mem_layer_2_n2_weights(w_layer2[2]),
        .data_out_mem_layer_2_n3_weights(w_layer2[3]),
        .data_out_mem_layer_2_n4_weights(w_layer2[4]),
        .data_out_mem_layer_2_n5_weights(w_layer2[5]),
        .data_out_mem_layer_2_n6_weights(w_layer2[6]),
        .data_out_mem_layer_2_n7_weights(w_layer2[7]),
        .data_out_mem_layer_2_n8_weights(w_layer2[8]),
        .data_out_mem_layer_2_n9_weights(w_layer2[9]),
        .data_out_mem_layer_2_n10_weights(w_layer2[10]),
        .data_out_mem_layer_2_n11_weights(w_layer2[11]),
        .data_out_mem_layer_2_n12_weights(w_layer2[12]),
        .data_out_mem_layer_2_n13_weights(w_layer2[13]),
        .data_out_mem_layer_2_n14_weights(w_layer2[14]),
        .data_out_mem_layer_2_n15_weights(w_layer2[15]),

        .data_out_mem_layer_2_n0_bias(bias_layer_2[0]),
        .data_out_mem_layer_2_n1_bias(bias_layer_2[1]),
        .data_out_mem_layer_2_n2_bias(bias_layer_2[2]),
        .data_out_mem_layer_2_n3_bias(bias_layer_2[3]),
        .data_out_mem_layer_2_n4_bias(bias_layer_2[4]),
        .data_out_mem_layer_2_n5_bias(bias_layer_2[5]),
        .data_out_mem_layer_2_n6_bias(bias_layer_2[6]),
        .data_out_mem_layer_2_n7_bias(bias_layer_2[7]),
        .data_out_mem_layer_2_n8_bias(bias_layer_2[8]),
        .data_out_mem_layer_2_n9_bias(bias_layer_2[9]),
        .data_out_mem_layer_2_n10_bias(bias_layer_2[10]),
        .data_out_mem_layer_2_n11_bias(bias_layer_2[11]),
        .data_out_mem_layer_2_n12_bias(bias_layer_2[12]),
        .data_out_mem_layer_2_n13_bias(bias_layer_2[13]),
        .data_out_mem_layer_2_n14_bias(bias_layer_2[14]),
        .data_out_mem_layer_2_n15_bias(bias_layer_2[15]),


        .data_out_mem_layer_3_n0_weights(w_layer3[0]),
        .data_out_mem_layer_3_n1_weights(w_layer3[1]),
        .data_out_mem_layer_3_n2_weights(w_layer3[2]),
        .data_out_mem_layer_3_n3_weights(w_layer3[3]),
        .data_out_mem_layer_3_n4_weights(w_layer3[4]),
        .data_out_mem_layer_3_n5_weights(w_layer3[5]),
        .data_out_mem_layer_3_n6_weights(w_layer3[6]),
        .data_out_mem_layer_3_n7_weights(w_layer3[7]),
        .data_out_mem_layer_3_n8_weights(w_layer3[8]),
        .data_out_mem_layer_3_n9_weights(w_layer3[9]),

        .data_out_mem_layer_3_n0_bias(bias_layer_3[0]),
        .data_out_mem_layer_3_n1_bias(bias_layer_3[1]),
        .data_out_mem_layer_3_n2_bias(bias_layer_3[2]),
        .data_out_mem_layer_3_n3_bias(bias_layer_3[3]),
        .data_out_mem_layer_3_n4_bias(bias_layer_3[4]),
        .data_out_mem_layer_3_n5_bias(bias_layer_3[5]),
        .data_out_mem_layer_3_n6_bias(bias_layer_3[6]),
        .data_out_mem_layer_3_n7_bias(bias_layer_3[7]),
        .data_out_mem_layer_3_n8_bias(bias_layer_3[8]),
        .data_out_mem_layer_3_n9_bias(bias_layer_3[9])
    );

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : LAYER1_NEURONS
            neuron #(
                .M0(M0_l1),
                .SHIFT(SHIFT_l1),
                .IN_ZP(IN_ZP_l1),
                .OUT_ZP(OUT_ZP_l1),
                .APPLY_RELU(1)
            ) neuron_l1_inst (
                .clk_neuron(clk_neuron),
                .enable_neuron(enable_layer_1),
                .accumulate_en(accumulate_en_layer_1),
                .input_data_neuron(data_out_mem),
                .weight_data_neuron(w_layer1[i]),
                .bias_data_neuron_nx(bias_layer_1[i]),
                .output_data_neuron(neuron_l1_outs[i])
            );
        end
    endgenerate
    

    reg signed [7:0] input_broadcast_layer2;
    always @(posedge clk_neuron) begin
        input_broadcast_layer2 <= neuron_l1_outs[addr_mem_layer_2_weights];
    end
    genvar y;
    generate
        for (y = 0; y < 16; y = y + 1) begin : LAYER2_NEURONS
            neuron #(
                .M0(M0_l2),
                .SHIFT(SHIFT_l2),
                .IN_ZP(IN_ZP_l2),
                .OUT_ZP(OUT_ZP_l2),
                .APPLY_RELU(1)
            ) neuron_l2_inst (
                .clk_neuron(clk_neuron),
                .enable_neuron(enable_layer_2),
                .accumulate_en(accumulate_en_layer_2),
                .input_data_neuron(input_broadcast_layer2),
                .weight_data_neuron(w_layer2[y]),
                .bias_data_neuron_nx(bias_layer_2[y]),
                .output_data_neuron(neuron_l2_outs[y])
            );
        end
    endgenerate
    

    reg signed [7:0] input_broadcast_layer3;
    always @(posedge clk_neuron) begin
        input_broadcast_layer3 <= neuron_l2_outs[addr_mem_layer_3_weights];
    end
    genvar z;
    generate
        for (z = 0; z < 10; z = z + 1) begin : LAYER3_NEURONS
            neuron #(
                .M0(M0_l3),
                .SHIFT(SHIFT_l3),
                .IN_ZP(IN_ZP_l3),
                .OUT_ZP(OUT_ZP_l3),
                .APPLY_RELU(0)
            ) neuron_l3_inst (
                .clk_neuron(clk_neuron),
                .enable_neuron(enable_layer_3),
                .accumulate_en(accumulate_en_layer_3),
                .input_data_neuron(input_broadcast_layer3),
                .weight_data_neuron(w_layer3[z]),
                .bias_data_neuron_nx(bias_layer_3[z]),
                .output_data_neuron(neuron_l3_outs[z])
            );
        end
    endgenerate


    wire signed [79:0] argmax_input;

    assign argmax_input[7:0]   = neuron_l3_outs[0];
    assign argmax_input[15:8]  = neuron_l3_outs[1];
    assign argmax_input[23:16] = neuron_l3_outs[2];
    assign argmax_input[31:24] = neuron_l3_outs[3];
    assign argmax_input[39:32] = neuron_l3_outs[4];
    assign argmax_input[47:40] = neuron_l3_outs[5];
    assign argmax_input[55:48] = neuron_l3_outs[6];
    assign argmax_input[63:56] = neuron_l3_outs[7];
    assign argmax_input[71:64] = neuron_l3_outs[8];
    assign argmax_input[79:72] = neuron_l3_outs[9];

    wire [3:0] argmax_output;

    argmax argmax_inst (
        .clk_argmax(clk_neuron),
        .enable_argmax(enable_argmax),
        .input_data_argmax(argmax_input),
        .output_data_argmax(argmax_output)
    );
    assign output_data = {'b0000, argmax_output};

endmodule