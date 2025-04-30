module seg7_display (
    input wire pump_status,
    output reg [6:0] seg_out,
    output reg [3:0] an
);

    always @(*) begin
        case (pump_status)
            1: seg_out = 7'b1110111; // 'H'
            0: seg_out = 7'b0000001; // '-'
        endcase
    end

    always @(*) begin
        an = 4'b1110; // Enable only the first 7-segment display
    end

endmodule
