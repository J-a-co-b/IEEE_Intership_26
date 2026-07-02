`timescale 1ns / 1ps

module warning_generator(
    input  wire clk_1hz,
    input  wire rst,
    input  wire temp_comp,
    input  wire vib_comp,

    output reg  temp_low,
    output reg  temp_mid,
    output reg  temp_high,

    output reg  vib_low,
    output reg  vib_mid,
    output reg  vib_high
);


reg [5:0] temp_count;
reg [5:0] vib_count;

always @(posedge clk_1hz or posedge rst) begin
    if (rst) begin
        temp_count <= 0;
        temp_low   <= 0;
        temp_mid   <= 0;
        temp_high  <= 0;

        vib_count  <= 0;
        vib_low    <= 0;
        vib_mid    <= 0;
        vib_high   <= 0;
    end 
    else begin
        
        if (temp_comp == 0) begin
            temp_count <= 0;
            temp_low   <= 0;
            temp_mid   <= 0;
            temp_high  <= 0;
        end 
        else begin
            if (temp_count < 6'd63) begin
                temp_count <= temp_count + 1;
            end

            if (temp_count >= 20) begin
                temp_low   <= 0;
                temp_mid   <= 0;
                temp_high  <= 1;
            end 
            else if (temp_count >= 10) begin
                temp_low   <= 0;
                temp_mid   <= 1;
                temp_high  <= 0;
            end 
            else if (temp_count >= 5) begin
                temp_low   <= 1;
                temp_mid   <= 0;
                temp_high  <= 0;
            end 
            else begin
                temp_low   <= 0;
                temp_mid   <= 0;
                temp_high  <= 0;
            end
        end

 
        if (vib_comp == 0) begin
            vib_count  <= 0;
            vib_low    <= 0;
            vib_mid    <= 0;
            vib_high   <= 0;
        end 
        else begin
            if (vib_count < 6'd63) begin
                vib_count <= vib_count + 1;
            end

            if (vib_count >= 20) begin
                vib_low    <= 0;
                vib_mid    <= 0;
                vib_high   <= 1;
            end 
            else if (vib_count >= 10) begin
                vib_low    <= 0;
                vib_mid    <= 1;
                vib_high   <= 0;
            end 
            else if (vib_count >= 5) begin
                vib_low    <= 1;
                vib_mid    <= 0;
                vib_high   <= 0;
            end 
            else begin
                vib_low    <= 0;
                vib_mid    <= 0;
                vib_high   <= 0;
            end
        end
    end
end

endmodule