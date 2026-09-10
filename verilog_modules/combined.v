module combined #(    
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
    input wire clk,
    input wire start,
    input wire [9:0] IMAGE_ID,
    input wire read_image,
    output wire finish,
    output wire [7:0] output_data
);

    wire enable_layer_1;
    wire enable_layer_2;
    wire enable_layer_3;

    wire accumulate_en_layer_1;
    wire accumulate_en_layer_2;
    wire accumulate_en_layer_3;

    wire [9:0] addr_mem_layer_1_weights;
    wire [4:0] addr_mem_layer_2_weights;
    wire [3:0] addr_mem_layer_3_weights;
    wire [9:0] addr_mem_data;

    wire read_en_mem_weights;
    wire read_en_mem_data;

    wire enable_argmax;

    control control_inst (
        .clk_cont(clk),
        .start(start),
        .finish(finish),

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

        .enable_argmax(enable_argmax)
    );

    nn nn_inst (
        .clk_neuron(clk),
        .IMAGE_ID(IMAGE_ID),
        .read_image(read_image),

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
endmodule