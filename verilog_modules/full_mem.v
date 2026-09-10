module full_mem #(
    parameter DEPTH_layer_1_weights = 784,
    address_width_layer_1_weights = $clog2(DEPTH_layer_1_weights), 

    DEPTH_layer_2_weights = 32, 
    address_width_layer_2_weights = $clog2(DEPTH_layer_2_weights), 
    
    DEPTH_layer_3_weights = 16, 
    address_width_layer_3_weights = $clog2(DEPTH_layer_3_weights), 

    DEPTH_layer_1_bias = 32,
    DEPTH_layer_2_bias = 16,
    DEPTH_layer_3_bias = 10,

    data_width_weights = 8,
    data_width_bias = 32
) (
    input wire clk_mem,
    input wire read_en_mem,
    input wire enable_mem_layer_1,
    input wire enable_mem_layer_2,
    input wire enable_mem_layer_3,

    input wire [address_width_layer_1_weights - 1 : 0] addr_mem_layer_1_weights,
    input wire [address_width_layer_2_weights - 1 : 0] addr_mem_layer_2_weights,
    input wire [address_width_layer_3_weights - 1 : 0] addr_mem_layer_3_weights,

    // layer 1 weights
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n0_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n1_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n2_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n3_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n4_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n5_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n6_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n7_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n8_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n9_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n10_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n11_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n12_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n13_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n14_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n15_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n16_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n17_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n18_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n19_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n20_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n21_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n22_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n23_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n24_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n25_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n26_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n27_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n28_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n29_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n30_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n31_weights,
    
    // layer 2 weights
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n0_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n1_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n2_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n3_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n4_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n5_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n6_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n7_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n8_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n9_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n10_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n11_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n12_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n13_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n14_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n15_weights,

    // layer 3 weights
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n0_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n1_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n2_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n3_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n4_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n5_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n6_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n7_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n8_weights,
    output wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n9_weights,

    // layer 1 bias
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n0_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n1_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n2_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n3_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n4_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n5_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n6_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n7_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n8_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n9_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n10_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n11_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n12_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n13_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n14_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n15_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n16_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n17_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n18_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n19_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n20_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n21_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n22_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n23_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n24_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n25_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n26_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n27_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n28_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n29_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n30_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_1_n31_bias,

    // layer 2 bias
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n0_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n1_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n2_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n3_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n4_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n5_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n6_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n7_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n8_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n9_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n10_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n11_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n12_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n13_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n14_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_2_n15_bias,

    // layer 3 bias
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n0_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n1_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n2_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n3_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n4_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n5_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n6_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n7_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n8_bias,
    output wire [data_width_bias - 1 : 0] data_out_mem_layer_3_n9_bias

);

    wire [data_width_weights - 1 : 0] layer1_weights [0 : 31];
    wire [data_width_weights - 1 : 0] layer2_weights [0 : 15];
    wire [data_width_weights - 1 : 0] layer3_weights [0 : 9];

    wire [data_width_bias - 1 : 0] layer1_bias [0 : 31];
    wire [data_width_bias - 1 : 0] layer2_bias [0 : 15];
    wire [data_width_bias - 1 : 0] layer3_bias [0 : 9];

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : LAYER1_MEMS
            mem #(
                .DEPTH(DEPTH_layer_1_weights),
                .address_width(address_width_layer_1_weights),
                .data_width(data_width_weights),
                .MEM_ID(i),
                .LAYER_ID(1)
            ) weights_mem (
                .clk_mem(clk_mem),
                .enable_mem(enable_mem_layer_1),
                .IMAGE_ID(),
                .read_image(),
                .read_mem(read_en_mem),
                .addr_mem(addr_mem_layer_1_weights),
                .data_out_mem(layer1_weights[i])
            );
        end
    endgenerate

    genvar bi;
    generate
        for (bi = 0; bi < 32; bi = bi + 1) begin : LAYER1_BIAS_MEMS
            mem #(
                .DEPTH(DEPTH_layer_1_bias),
                .address_width($clog2(DEPTH_layer_1_bias)),
                .data_width(data_width_bias),
                .MEM_ID(bi),
                .LAYER_ID(4)
            ) bias_mem (
                .clk_mem(clk_mem),
                .enable_mem(enable_mem_layer_1),
                .IMAGE_ID(),
                .read_image(),
                .read_mem(read_en_mem),
                .addr_mem(bi[$clog2(DEPTH_layer_1_bias) - 1 : 0]),
                .data_out_mem(layer1_bias[bi])
            );
        end
    endgenerate


    genvar j;
    generate
        for (j = 0; j < 16; j = j + 1) begin : LAYER2_MEMS
            mem #(
                .DEPTH(DEPTH_layer_2_weights),
                .address_width(address_width_layer_2_weights),
                .data_width(data_width_weights),
                .MEM_ID(j),
                .LAYER_ID(2)
            ) weights_mem (
                .clk_mem(clk_mem),
                .enable_mem(enable_mem_layer_2),
                .IMAGE_ID(),
                .read_image(),
                .read_mem(read_en_mem),
                .addr_mem(addr_mem_layer_2_weights),
                .data_out_mem(layer2_weights[j])
            );
        end
    endgenerate

    genvar bj;
    generate
        for (bj = 0; bj < 16; bj = bj + 1) begin : LAYER2_BIAS_MEMS
            mem #(
                .DEPTH(DEPTH_layer_2_bias),
                .address_width($clog2(DEPTH_layer_2_bias)),
                .data_width(data_width_bias),
                .MEM_ID(bj),
                .LAYER_ID(5)
            ) bias_mem (
                .clk_mem(clk_mem),
                .enable_mem(enable_mem_layer_2),
                .IMAGE_ID(),
                .read_image(),
                .read_mem(read_en_mem),
                .addr_mem(bj[$clog2(DEPTH_layer_2_bias) - 1 : 0]),
                .data_out_mem(layer2_bias[bj])
            );
        end
    endgenerate


    genvar k;
    generate
        for (k = 0; k < 10; k = k + 1) begin : LAYER3_MEMS
            mem #(
                .DEPTH(DEPTH_layer_3_weights),
                .address_width(address_width_layer_3_weights),
                .data_width(data_width_weights),
                .MEM_ID(k),
                .LAYER_ID(3)
            ) weights_mem (
                .clk_mem(clk_mem),
                .enable_mem(enable_mem_layer_3),
                .IMAGE_ID(),
                .read_image(),
                .read_mem(read_en_mem),
                .addr_mem(addr_mem_layer_3_weights),
                .data_out_mem(layer3_weights[k])
            );
        end
    endgenerate

    genvar bk;
    generate
        for (bk = 0; bk < 10; bk = bk + 1) begin : LAYER3_BIAS_MEMS
            mem #(
                .DEPTH(DEPTH_layer_3_bias),
                .address_width($clog2(DEPTH_layer_3_bias)),
                .data_width(data_width_bias),
                .MEM_ID(bk),
                .LAYER_ID(6)
            ) bias_mem (
                .clk_mem(clk_mem),
                .enable_mem(enable_mem_layer_3),
                .IMAGE_ID(),
                .read_image(),
                .read_mem(read_en_mem),
                .addr_mem(bk[$clog2(DEPTH_layer_3_bias) - 1 : 0]),
                .data_out_mem(layer3_bias[bk])
            );
        end
    endgenerate

    // ---------------- LAYER 1 ----------------
    assign data_out_mem_layer_1_n0_weights = layer1_weights[0];
    assign data_out_mem_layer_1_n1_weights = layer1_weights[1];
    assign data_out_mem_layer_1_n2_weights = layer1_weights[2];
    assign data_out_mem_layer_1_n3_weights = layer1_weights[3];
    assign data_out_mem_layer_1_n4_weights = layer1_weights[4];
    assign data_out_mem_layer_1_n5_weights = layer1_weights[5];
    assign data_out_mem_layer_1_n6_weights = layer1_weights[6];
    assign data_out_mem_layer_1_n7_weights = layer1_weights[7];
    assign data_out_mem_layer_1_n8_weights = layer1_weights[8];
    assign data_out_mem_layer_1_n9_weights = layer1_weights[9];
    assign data_out_mem_layer_1_n10_weights = layer1_weights[10];
    assign data_out_mem_layer_1_n11_weights = layer1_weights[11];
    assign data_out_mem_layer_1_n12_weights = layer1_weights[12];
    assign data_out_mem_layer_1_n13_weights = layer1_weights[13];
    assign data_out_mem_layer_1_n14_weights = layer1_weights[14];
    assign data_out_mem_layer_1_n15_weights = layer1_weights[15];
    assign data_out_mem_layer_1_n16_weights = layer1_weights[16];
    assign data_out_mem_layer_1_n17_weights = layer1_weights[17];
    assign data_out_mem_layer_1_n18_weights = layer1_weights[18];
    assign data_out_mem_layer_1_n19_weights = layer1_weights[19];
    assign data_out_mem_layer_1_n20_weights = layer1_weights[20];
    assign data_out_mem_layer_1_n21_weights = layer1_weights[21];
    assign data_out_mem_layer_1_n22_weights = layer1_weights[22];
    assign data_out_mem_layer_1_n23_weights = layer1_weights[23];
    assign data_out_mem_layer_1_n24_weights = layer1_weights[24];
    assign data_out_mem_layer_1_n25_weights = layer1_weights[25];
    assign data_out_mem_layer_1_n26_weights = layer1_weights[26];
    assign data_out_mem_layer_1_n27_weights = layer1_weights[27];
    assign data_out_mem_layer_1_n28_weights = layer1_weights[28];
    assign data_out_mem_layer_1_n29_weights = layer1_weights[29];
    assign data_out_mem_layer_1_n30_weights = layer1_weights[30];
    assign data_out_mem_layer_1_n31_weights = layer1_weights[31];

    assign data_out_mem_layer_1_n0_bias = layer1_bias[0];
    assign data_out_mem_layer_1_n1_bias = layer1_bias[1];
    assign data_out_mem_layer_1_n2_bias = layer1_bias[2];
    assign data_out_mem_layer_1_n3_bias = layer1_bias[3];
    assign data_out_mem_layer_1_n4_bias = layer1_bias[4];
    assign data_out_mem_layer_1_n5_bias = layer1_bias[5];
    assign data_out_mem_layer_1_n6_bias = layer1_bias[6];
    assign data_out_mem_layer_1_n7_bias = layer1_bias[7];
    assign data_out_mem_layer_1_n8_bias = layer1_bias[8];
    assign data_out_mem_layer_1_n9_bias = layer1_bias[9];
    assign data_out_mem_layer_1_n10_bias = layer1_bias[10];
    assign data_out_mem_layer_1_n11_bias = layer1_bias[11];
    assign data_out_mem_layer_1_n12_bias = layer1_bias[12];
    assign data_out_mem_layer_1_n13_bias = layer1_bias[13];
    assign data_out_mem_layer_1_n14_bias = layer1_bias[14];
    assign data_out_mem_layer_1_n15_bias = layer1_bias[15];
    assign data_out_mem_layer_1_n16_bias = layer1_bias[16];
    assign data_out_mem_layer_1_n17_bias = layer1_bias[17];
    assign data_out_mem_layer_1_n18_bias = layer1_bias[18];
    assign data_out_mem_layer_1_n19_bias = layer1_bias[19];
    assign data_out_mem_layer_1_n20_bias = layer1_bias[20];
    assign data_out_mem_layer_1_n21_bias = layer1_bias[21];
    assign data_out_mem_layer_1_n22_bias = layer1_bias[22];
    assign data_out_mem_layer_1_n23_bias = layer1_bias[23];
    assign data_out_mem_layer_1_n24_bias = layer1_bias[24];
    assign data_out_mem_layer_1_n25_bias = layer1_bias[25];
    assign data_out_mem_layer_1_n26_bias = layer1_bias[26];
    assign data_out_mem_layer_1_n27_bias = layer1_bias[27];
    assign data_out_mem_layer_1_n28_bias = layer1_bias[28];
    assign data_out_mem_layer_1_n29_bias = layer1_bias[29];
    assign data_out_mem_layer_1_n30_bias = layer1_bias[30];
    assign data_out_mem_layer_1_n31_bias = layer1_bias[31];

    // ---------------- LAYER 2 ----------------
    assign data_out_mem_layer_2_n0_weights = layer2_weights[0];
    assign data_out_mem_layer_2_n1_weights = layer2_weights[1];
    assign data_out_mem_layer_2_n2_weights = layer2_weights[2];
    assign data_out_mem_layer_2_n3_weights = layer2_weights[3];
    assign data_out_mem_layer_2_n4_weights = layer2_weights[4];
    assign data_out_mem_layer_2_n5_weights = layer2_weights[5];
    assign data_out_mem_layer_2_n6_weights = layer2_weights[6];
    assign data_out_mem_layer_2_n7_weights = layer2_weights[7];
    assign data_out_mem_layer_2_n8_weights = layer2_weights[8];
    assign data_out_mem_layer_2_n9_weights = layer2_weights[9];
    assign data_out_mem_layer_2_n10_weights = layer2_weights[10];
    assign data_out_mem_layer_2_n11_weights = layer2_weights[11];
    assign data_out_mem_layer_2_n12_weights = layer2_weights[12];
    assign data_out_mem_layer_2_n13_weights = layer2_weights[13];
    assign data_out_mem_layer_2_n14_weights = layer2_weights[14];
    assign data_out_mem_layer_2_n15_weights = layer2_weights[15];

    assign data_out_mem_layer_2_n0_bias = layer2_bias[0];
    assign data_out_mem_layer_2_n1_bias = layer2_bias[1];
    assign data_out_mem_layer_2_n2_bias = layer2_bias[2];
    assign data_out_mem_layer_2_n3_bias = layer2_bias[3];
    assign data_out_mem_layer_2_n4_bias = layer2_bias[4];
    assign data_out_mem_layer_2_n5_bias = layer2_bias[5];
    assign data_out_mem_layer_2_n6_bias = layer2_bias[6];
    assign data_out_mem_layer_2_n7_bias = layer2_bias[7];
    assign data_out_mem_layer_2_n8_bias = layer2_bias[8];
    assign data_out_mem_layer_2_n9_bias = layer2_bias[9];
    assign data_out_mem_layer_2_n10_bias = layer2_bias[10];
    assign data_out_mem_layer_2_n11_bias = layer2_bias[11];
    assign data_out_mem_layer_2_n12_bias = layer2_bias[12];
    assign data_out_mem_layer_2_n13_bias = layer2_bias[13];
    assign data_out_mem_layer_2_n14_bias = layer2_bias[14];
    assign data_out_mem_layer_2_n15_bias = layer2_bias[15];

    // ---------------- LAYER 3 ----------------
    assign data_out_mem_layer_3_n0_weights = layer3_weights[0];
    assign data_out_mem_layer_3_n1_weights = layer3_weights[1];
    assign data_out_mem_layer_3_n2_weights = layer3_weights[2];
    assign data_out_mem_layer_3_n3_weights = layer3_weights[3];
    assign data_out_mem_layer_3_n4_weights = layer3_weights[4];
    assign data_out_mem_layer_3_n5_weights = layer3_weights[5];
    assign data_out_mem_layer_3_n6_weights = layer3_weights[6];
    assign data_out_mem_layer_3_n7_weights = layer3_weights[7];
    assign data_out_mem_layer_3_n8_weights = layer3_weights[8];
    assign data_out_mem_layer_3_n9_weights = layer3_weights[9];

    assign data_out_mem_layer_3_n0_bias = layer3_bias[0];
    assign data_out_mem_layer_3_n1_bias = layer3_bias[1];
    assign data_out_mem_layer_3_n2_bias = layer3_bias[2];
    assign data_out_mem_layer_3_n3_bias = layer3_bias[3];
    assign data_out_mem_layer_3_n4_bias = layer3_bias[4];
    assign data_out_mem_layer_3_n5_bias = layer3_bias[5];
    assign data_out_mem_layer_3_n6_bias = layer3_bias[6];
    assign data_out_mem_layer_3_n7_bias = layer3_bias[7];
    assign data_out_mem_layer_3_n8_bias = layer3_bias[8];
    assign data_out_mem_layer_3_n9_bias = layer3_bias[9];

endmodule