`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 14:50:02
// Design Name: 
// Module Name: updown_tb
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


module updown_tb;
reg clk,rst,updown;
wire [3:0]y;

updownCounter uut(
    .clk(clk),
    .rst(rst),
    .updown(updown),
    .y(y)
    );
always #5 clk=~clk;

initial begin
       clk =0;
       rst=0;
       updown=0;
       
       rst=1;
       
       #15;
       rst=0;
       updown=1;
       #100;
       
       updown=0;
       #100;
       
$finish;
end

       
 
endmodule
