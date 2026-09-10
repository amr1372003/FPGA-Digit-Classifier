module neuron #(
    parameter signed [31:0] M0 = 1930144863, 
    parameter integer SHIFT = 43,
    parameter signed [8:0] IN_ZP = 17,
    parameter signed [8:0] OUT_ZP = 0,
    parameter APPLY_RELU = 1
) (
    input wire clk_neuron,
    input wire enable_neuron,
    input wire accumulate_en,
    input wire [7:0] input_data_neuron,
    input wire signed [7:0] weight_data_neuron,
    input wire signed [31:0] bias_data_neuron_nx,
    output reg signed [7:0] output_data_neuron
);

    wire signed [8:0] input_data_zx = $signed({1'b0, input_data_neuron});

    reg signed [31 : 0] accumulator;
    always @(posedge clk_neuron) begin
        if (!enable_neuron) begin
            accumulator <= 0;
        end
        else if (accumulate_en) begin
            accumulator <= accumulator + (input_data_zx - IN_ZP) * (weight_data_neuron);
        end
    end

    wire signed [63:0] rescaled   = (((accumulator + bias_data_neuron_nx) * M0) + (64'sd1 <<< (SHIFT - 1))) >>> SHIFT;
    wire signed [31:0] with_zp      = rescaled[31:0] + OUT_ZP;

    wire signed [31:0] after_relu = (APPLY_RELU && (with_zp < OUT_ZP)) ? OUT_ZP : with_zp;
    
    wire signed [31:0] clipped =
        (after_relu > 127)  ? 32'sd127   :
        (after_relu < -128) ? -32'sd128  :
                                after_relu;

    always @(posedge clk_neuron) begin
        if (enable_neuron) begin
            output_data_neuron <= clipped[7:0];
        end
    end

endmodule