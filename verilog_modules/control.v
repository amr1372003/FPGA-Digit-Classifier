module control (
    input wire clk_cont,
    input wire start,

    output reg finish,

    output reg enable_layer_1,
    output reg enable_layer_2,
    output reg enable_layer_3,

    output reg accumulate_en_layer_1,
    output reg accumulate_en_layer_2,
    output reg accumulate_en_layer_3,

    output reg [9:0] addr_mem_layer_1_weights,
    output reg [4:0] addr_mem_layer_2_weights,
    output reg [3:0] addr_mem_layer_3_weights,
    output reg [9:0] addr_mem_data,

    output reg read_en_mem_weights,
    output reg read_en_mem_data,

    output reg enable_argmax
);

    localparam IDLE   = 0;
    localparam L1     = 1;
    localparam L2     = 2;
    localparam L3     = 3;
    localparam ARGMAX = 4;
    reg [2:0] state;

    localparam N1 = 28 * 28;
    localparam N2 = 32;
    localparam N3 = 16;

    integer counter;

    always @(posedge clk_cont) begin

        finish <= 0;

        enable_layer_1 <= 0;
        enable_layer_2 <= 0;
        enable_layer_3 <= 0;

        accumulate_en_layer_1 <= 0;
        accumulate_en_layer_2 <= 0;
        accumulate_en_layer_3 <= 0;

        read_en_mem_weights <= 0;
        read_en_mem_data <= 0;

        enable_argmax <= 0;


        case (state)
            IDLE: begin
                counter <= 0;
                addr_mem_layer_1_weights <= 0;
                addr_mem_layer_2_weights <= 0;
                addr_mem_layer_3_weights <= 0;
                addr_mem_data <= 0;

                if (start) begin
                    state <= L1;
                    counter <= 0;

                    enable_layer_1 <= 1;
                    accumulate_en_layer_1 <= 1;

                    read_en_mem_weights <= 1;
                    read_en_mem_data <= 1;

                    addr_mem_layer_1_weights <= 0;
                    addr_mem_data <= 0;
                end
            end

            L1: begin
                enable_layer_1 <= 1;
                read_en_mem_weights <= 1;
                read_en_mem_data <= 1;

                if (counter < N1) begin
                    addr_mem_layer_1_weights <= counter[9:0];
                    addr_mem_data <= counter[9:0];
                end
                else begin
                    addr_mem_layer_1_weights <= N1 - 1;
                    addr_mem_data <= N1 - 1;
                end

                if (counter == 1 || counter == N1 + 1)
                    accumulate_en_layer_1 <= 0;
                else
                    accumulate_en_layer_1 <= 1;

                if (counter == N1 + 1) begin
                    counter <= 0;
                    addr_mem_layer_2_weights <= 0;
                    enable_layer_2 <= 1;
                    state <= L2;
                end
                else begin
                    counter <= counter + 1;
                end
            end

            L2: begin
                enable_layer_2 <= 1;
                read_en_mem_weights <= 1;

                if (counter < N2)
                    addr_mem_layer_2_weights <= counter[4:0];
                else
                    addr_mem_layer_2_weights <= N2 - 1;

                if (counter == 1 || counter == N2 + 1)
                    accumulate_en_layer_2 <= 0;
                else
                    accumulate_en_layer_2 <= 1;

                if (counter == N2 + 1) begin
                    counter <= 0;
                    addr_mem_layer_3_weights <= 0;
                    enable_layer_3 <= 1;
                    state <= L3;
                end
                else begin
                    counter <= counter + 1;
                end
            end

            L3: begin
                enable_layer_3 <= 1;
                read_en_mem_weights <= 1;

                if (counter < N3)
                    addr_mem_layer_3_weights <= counter[3:0];
                else
                    addr_mem_layer_3_weights <= N3 - 1;

                if (counter == 1 || counter == N3 + 1)
                    accumulate_en_layer_3 <= 0;
                else
                    accumulate_en_layer_3 <= 1;

                if (counter == N3 + 1) begin
                    counter <= 0;
                    state <= ARGMAX;
                end
                else begin
                    counter <= counter + 1;
                end
            end

            ARGMAX: begin
                if (counter == 0) begin
                    enable_argmax <= 1;
                    counter <= 1;
                end
                else begin
                    finish <= 1;
                    counter <= 0;
                    state <= IDLE;
                end
            end

            default: begin
                state <= IDLE;
                counter <= 0;
            end
        endcase
    end

endmodule