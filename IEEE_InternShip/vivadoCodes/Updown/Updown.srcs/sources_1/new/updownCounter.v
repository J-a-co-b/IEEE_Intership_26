`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 14:43:06
// Design Name: 
// Module Name: updownCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module updownCounter(
input clk,rst,
input updown,
output  reg [3:0]y
    );
    
reg [26:0]count;
reg slow_clk;
always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 27'd0;
            slow_clk <= 1'b0;
        end else if (count == 27'd49_999_999) begin
            count <= 27'd0;
            slow_clk <= ~slow_clk; // Toggle the internal slow clock
        end else begin
            count <= count + 1'b1;
        end
    end

always @(posedge slow_clk or posedge rst)
begin
if(rst)
    y<=4'b0000;
else
    if(updown)
        y<=y+1'b1;
    else
        y<=y-1'b1;
end    
endmodule
