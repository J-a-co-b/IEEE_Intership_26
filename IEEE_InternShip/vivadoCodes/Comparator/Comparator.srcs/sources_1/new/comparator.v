`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 15:39:10
// Design Name: 
// Module Name: comparator
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


module comparator(
input a,b,
output y0,y1,y2

    );
    wire bnot,anot;
assign anot=~a;
assign bnot=~b;
assign y0= a&b | anot&bnot;
assign y1=anot&b;
assign y2=a&bnot;



endmodule
