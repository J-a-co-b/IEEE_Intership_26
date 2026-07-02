

`timescale 1ns / 1ps

module comparator_temp(
    input  wire       clk,
    input  wire       rst,
    input  wire [7:0] temp_value,
    output reg        temp_comp
);

    parameter TEMP_THRESHOLD = 8'd190;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            temp_comp <= 1'b0; // Use <= for resets
        end 
        else begin
            // FIXED: Use non-blocking assignment (<=) for clocked logic
            temp_comp <= (temp_value > TEMP_THRESHOLD);
        end
    end

endmodule