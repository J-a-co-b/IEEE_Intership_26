`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 14:38:53
// Design Name: 
// Module Name: mux
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


module mux2(
 input a,b,s,
 output reg y
    );
 always @(*) begin
 case(s)
    1'b0 : y=a;
    1'b1 : y=b;
 endcase
 end
   
 

endmodule

module mux4(
    input a,b,c,d,s0,s1,
    output  y
    );
    wire w1,w2;
    mux2 m1(a,b,s0,w1);
    mux2 m2(c,d,s0,w2);
    mux2 m3(w1,w2,s1,y);
 endmodule
    