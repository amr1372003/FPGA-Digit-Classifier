module full_mem_tb #(
    parameter DEPTH_layer_1_weights = 784,
    parameter address_width_layer_1_weights = $clog2(DEPTH_layer_1_weights), 

    parameter DEPTH_layer_2_weights = 32, 
    parameter address_width_layer_2_weights = $clog2(DEPTH_layer_2_weights), 
    
    parameter DEPTH_layer_3_weights = 16, 
    parameter address_width_layer_3_weights = $clog2(DEPTH_layer_3_weights), 

    parameter data_width_weights = 8
);
    reg clk_mem;
    reg read_en_mem;

    reg [address_width_layer_1_weights - 1 : 0] addr_mem_layer_1_weights;
    reg [address_width_layer_2_weights - 1 : 0] addr_mem_layer_2_weights;
    reg [address_width_layer_3_weights - 1 : 0] addr_mem_layer_3_weights;

    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n0_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n1_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n2_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n3_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n4_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n5_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n6_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n7_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n8_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n9_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n10_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n11_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n12_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n13_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n14_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n15_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n16_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n17_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n18_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n19_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n20_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n21_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n22_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n23_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n24_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n25_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n26_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n27_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n28_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n29_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n30_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_1_n31_weights;


    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n0_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n1_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n2_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n3_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n4_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n5_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n6_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n7_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n8_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n9_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n10_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n11_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n12_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n13_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n14_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_2_n15_weights;

    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n0_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n1_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n2_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n3_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n4_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n5_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n6_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n7_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n8_weights;
    wire [data_width_weights - 1 : 0] data_out_mem_layer_3_n9_weights;


    full_mem #(
        .DEPTH_layer_1_weights(784),
        .DEPTH_layer_2_weights(32),
        .DEPTH_layer_3_weights(16),
        .data_width_weights(8)
    ) DUT (
        .clk_mem(clk_mem),
        .read_en_mem(read_en_mem),

        .addr_mem_layer_1_weights(addr_mem_layer_1_weights),
        .addr_mem_layer_2_weights(addr_mem_layer_2_weights),
        .addr_mem_layer_3_weights(addr_mem_layer_3_weights),

        .data_out_mem_layer_1_n0_weights(data_out_mem_layer_1_n0_weights),
        .data_out_mem_layer_1_n1_weights(data_out_mem_layer_1_n1_weights),
        .data_out_mem_layer_1_n2_weights(data_out_mem_layer_1_n2_weights),
        .data_out_mem_layer_1_n3_weights(data_out_mem_layer_1_n3_weights),
        .data_out_mem_layer_1_n4_weights(data_out_mem_layer_1_n4_weights),
        .data_out_mem_layer_1_n5_weights(data_out_mem_layer_1_n5_weights),
        .data_out_mem_layer_1_n6_weights(data_out_mem_layer_1_n6_weights),
        .data_out_mem_layer_1_n7_weights(data_out_mem_layer_1_n7_weights),
        .data_out_mem_layer_1_n8_weights(data_out_mem_layer_1_n8_weights),
        .data_out_mem_layer_1_n9_weights(data_out_mem_layer_1_n9_weights),
        .data_out_mem_layer_1_n10_weights(data_out_mem_layer_1_n10_weights),
        .data_out_mem_layer_1_n11_weights(data_out_mem_layer_1_n11_weights),
        .data_out_mem_layer_1_n12_weights(data_out_mem_layer_1_n12_weights),
        .data_out_mem_layer_1_n13_weights(data_out_mem_layer_1_n13_weights),
        .data_out_mem_layer_1_n14_weights(data_out_mem_layer_1_n14_weights),
        .data_out_mem_layer_1_n15_weights(data_out_mem_layer_1_n15_weights),
        .data_out_mem_layer_1_n16_weights(data_out_mem_layer_1_n16_weights),
        .data_out_mem_layer_1_n17_weights(data_out_mem_layer_1_n17_weights),
        .data_out_mem_layer_1_n18_weights(data_out_mem_layer_1_n18_weights),
        .data_out_mem_layer_1_n19_weights(data_out_mem_layer_1_n19_weights),
        .data_out_mem_layer_1_n20_weights(data_out_mem_layer_1_n20_weights),
        .data_out_mem_layer_1_n21_weights(data_out_mem_layer_1_n21_weights),
        .data_out_mem_layer_1_n22_weights(data_out_mem_layer_1_n22_weights),
        .data_out_mem_layer_1_n23_weights(data_out_mem_layer_1_n23_weights),
        .data_out_mem_layer_1_n24_weights(data_out_mem_layer_1_n24_weights),
        .data_out_mem_layer_1_n25_weights(data_out_mem_layer_1_n25_weights),
        .data_out_mem_layer_1_n26_weights(data_out_mem_layer_1_n26_weights),
        .data_out_mem_layer_1_n27_weights(data_out_mem_layer_1_n27_weights),
        .data_out_mem_layer_1_n28_weights(data_out_mem_layer_1_n28_weights),
        .data_out_mem_layer_1_n29_weights(data_out_mem_layer_1_n29_weights),
        .data_out_mem_layer_1_n30_weights(data_out_mem_layer_1_n30_weights),
        .data_out_mem_layer_1_n31_weights(data_out_mem_layer_1_n31_weights),
        .data_out_mem_layer_2_n0_weights(data_out_mem_layer_2_n0_weights),
        .data_out_mem_layer_2_n1_weights(data_out_mem_layer_2_n1_weights),
        .data_out_mem_layer_2_n2_weights(data_out_mem_layer_2_n2_weights),
        .data_out_mem_layer_2_n3_weights(data_out_mem_layer_2_n3_weights),
        .data_out_mem_layer_2_n4_weights(data_out_mem_layer_2_n4_weights),
        .data_out_mem_layer_2_n5_weights(data_out_mem_layer_2_n5_weights),
        .data_out_mem_layer_2_n6_weights(data_out_mem_layer_2_n6_weights),
        .data_out_mem_layer_2_n7_weights(data_out_mem_layer_2_n7_weights),
        .data_out_mem_layer_2_n8_weights(data_out_mem_layer_2_n8_weights),
        .data_out_mem_layer_2_n9_weights(data_out_mem_layer_2_n9_weights),
        .data_out_mem_layer_2_n10_weights(data_out_mem_layer_2_n10_weights),
        .data_out_mem_layer_2_n11_weights(data_out_mem_layer_2_n11_weights),
        .data_out_mem_layer_2_n12_weights(data_out_mem_layer_2_n12_weights),
        .data_out_mem_layer_2_n13_weights(data_out_mem_layer_2_n13_weights),
        .data_out_mem_layer_2_n14_weights(data_out_mem_layer_2_n14_weights),
        .data_out_mem_layer_2_n15_weights(data_out_mem_layer_2_n15_weights),
        .data_out_mem_layer_3_n0_weights(data_out_mem_layer_3_n0_weights),
        .data_out_mem_layer_3_n1_weights(data_out_mem_layer_3_n1_weights),
        .data_out_mem_layer_3_n2_weights(data_out_mem_layer_3_n2_weights),
        .data_out_mem_layer_3_n3_weights(data_out_mem_layer_3_n3_weights),
        .data_out_mem_layer_3_n4_weights(data_out_mem_layer_3_n4_weights),
        .data_out_mem_layer_3_n5_weights(data_out_mem_layer_3_n5_weights),
        .data_out_mem_layer_3_n6_weights(data_out_mem_layer_3_n6_weights),
        .data_out_mem_layer_3_n7_weights(data_out_mem_layer_3_n7_weights),
        .data_out_mem_layer_3_n8_weights(data_out_mem_layer_3_n8_weights),
        .data_out_mem_layer_3_n9_weights(data_out_mem_layer_3_n9_weights)
    );

    always #5 clk_mem = ~clk_mem;

    initial begin
        clk_mem = 0;
        read_en_mem = 0;
        addr_mem_layer_1_weights = 0;
        addr_mem_layer_2_weights = 0;
        addr_mem_layer_3_weights = 0;
        #10;
        read_en_mem = 1;
        #10;
        read_en_mem = 0;
        $display("Reading layer 1 weights:");
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n0_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n1_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n2_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n3_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n4_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n5_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n6_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n7_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n8_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n9_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n10_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n11_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n12_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n13_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n14_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n15_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n16_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n17_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n18_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n19_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n20_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n21_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n22_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n23_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n24_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n25_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n26_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n27_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n28_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n29_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n30_weights);
        $display("Address: %d, Data: %h", addr_mem_layer_1_weights, data_out_mem_layer_1_n31_weights);
    end
endmodule
