module mem #(
    parameter DEPTH = 784,
    address_width = $clog2(DEPTH),
    data_width = 8,
    parameter integer MEM_ID = 0,
    parameter integer LAYER_ID = 1
) (
    input wire clk_mem,
    input wire enable_mem,
    input wire read_mem,
    input wire [9:0]IMAGE_ID,
    input wire read_image,
    input wire [address_width - 1 : 0] addr_mem,
    output reg [data_width - 1 : 0] data_out_mem
);

    reg [data_width - 1 : 0] mem [0 : DEPTH - 1];

    reg [255:0] filename;

    initial begin
        if (LAYER_ID == 1) begin
            $sformat(filename, "linear1_weights_n%0d.txt", MEM_ID);
            $readmemh(filename, mem);
        end
        else if (LAYER_ID == 2) begin
            $sformat(filename, "linear2_weights_n%0d.txt", MEM_ID);
            $readmemh(filename, mem);
        end
        else if (LAYER_ID == 3) begin
            $sformat(filename, "linear3_weights_n%0d.txt", MEM_ID);
            $readmemh(filename, mem);
        end
        else if (LAYER_ID == 4) begin
            $sformat(filename, "linear1_bias_int32.txt");
            $readmemh(filename, mem);
        end
        else if (LAYER_ID == 5) begin
            $sformat(filename, "linear2_bias_int32.txt");
            $readmemh(filename, mem);
        end
        else if (LAYER_ID == 6) begin
            $sformat(filename, "linear3_bias_int32.txt");
            $readmemh(filename, mem);
        end
    end

    always @(posedge clk_mem) begin
        if (enable_mem) begin
            if (read_mem)
                data_out_mem <= mem[addr_mem];
            else
                data_out_mem <= 0;
        end
        else begin
            data_out_mem <= 0;
        end

        if (read_image) begin
            if (IMAGE_ID < 10) begin
                $sformat(filename, "test_image_00%0d.txt", IMAGE_ID);
                //$display("Reading image file: %s", filename);
            end
            else if (IMAGE_ID < 100) begin
                $sformat(filename, "test_image_0%0d.txt", IMAGE_ID);
                //$display("Reading image file: %s", filename);
            end
            else begin
                $sformat(filename, "test_image_%0d.txt", IMAGE_ID);
                //$display("Reading image file: %s", filename);
            end
            $readmemh(filename, mem);
        end
        
    end

endmodule