module dht11_reader (
    input wire clk,
    input wire rst,
    inout wire dht_data,
    output reg [7:0] humidity
);

    reg [31:0] counter = 0;
    reg [5:0] bit_index = 0;
    reg [39:0] data = 0;
    reg [3:0] state = 0;
    reg data_out = 1;
    reg dht_data_dir = 0;

    parameter START_TIME = 18_000_000; // ~18ms
    parameter SAMPLE_DELAY = 3_000;    // ~30us

    assign dht_data = (dht_data_dir) ? data_out : 1'bz;
    wire dht_input = dht_data;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0;
            counter <= 0;
            bit_index <= 0;
            data <= 0;
            humidity <= 0;
            dht_data_dir <= 1;
            data_out <= 1;
        end else begin
            case (state)
                0: begin // Start signal
                    dht_data_dir <= 1;
                    data_out <= 0;
                    counter <= counter + 1;
                    if (counter > START_TIME) begin
                        counter <= 0;
                        data_out <= 1;
                        dht_data_dir <= 0;
                        state <= 1;
                    end
                end
                1: begin // Wait before reading
                    counter <= counter + 1;
                    if (counter > SAMPLE_DELAY * 100) begin
                        counter <= 0;
                        state <= 2;
                    end
                end
                2: begin // Read 40 bits (simplified, not full spec)
                    if (bit_index < 40) begin
                        counter <= counter + 1;
                        if (counter > SAMPLE_DELAY) begin
                            data <= {data[38:0], dht_input};
                            bit_index <= bit_index + 1;
                            counter <= 0;
                        end
                    end else begin
                        humidity <= data[39:32];
                        state <= 3;
                    end
                end
                3: begin // Done, idle
                    // Optional: add repeating or reset logic
                end
            endcase
        end
    end

endmodule