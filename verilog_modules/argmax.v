module argmax(
    input wire clk_argmax,
    input wire enable_argmax,
    input wire signed [79:0] input_data_argmax,
    output reg [3:0] output_data_argmax
);

    integer i;

    reg signed [7:0] max_value;
    reg [3:0] max_index;
    reg signed [7:0] current_value;

    always @(posedge clk_argmax) begin

        if (enable_argmax) begin

            max_value = input_data_argmax[7:0];
            max_index = 'd0;
            // $display("Neuron %0d: Value = %0d, Current Max = %0d, Max Index = %0d", 0, max_value, max_value, max_index);
            for (i = 1; i < 10; i = i + 1) begin
                current_value = input_data_argmax[(i*8) +: 8];
                if (current_value > max_value) begin
                    max_value = current_value;
                    max_index = i;
                end
                // $display("Neuron %0d: Value = %0d, Current Max = %0d, Max Index = %0d", i, current_value, max_value, max_index);
            end

            output_data_argmax <= max_index;
        end

    end

endmodule