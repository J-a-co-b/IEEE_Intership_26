`timescale 1ns / 1ps

module comparator_vib(
    input  wire signed [7:0] vib_value,
    input  wire              clk,
    input  wire              rst,
    output reg               vib_comp
);

    parameter signed [7:0] VIB_THRESHOLD = 8'sd120; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            vib_comp <= 1'b0;
        end 
        else begin
            // Perfect use of non-blocking assignment and signed comparison
            vib_comp <= (vib_value > VIB_THRESHOLD);
        end
    end

endmodule