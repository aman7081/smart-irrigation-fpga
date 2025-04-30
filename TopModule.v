module top_module (
    input wire clk,
    input wire rst,
    inout wire dht_data,
    output wire pump_status,
    output wire [6:0] seg_out,
    output wire [3:0] an
);

    wire [7:0] humidity;

    dht11_reader reader (
        .clk(clk),
        .rst(rst),
        .dht_data(dht_data),
        .humidity(humidity)
    );

    smart_irrigation irrigate (
        .clk(clk),
        .rst(rst),
        .humidity(humidity),
        .pump_status(pump_status),
        .seg_out(seg_out),
        .an(an)
    );

endmodule