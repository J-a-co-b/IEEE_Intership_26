`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 11:38:27
// Design Name: 
// Module Name: Full_adder
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


module Full_adder(
 input a,b,cin,
 output sum,cout
    );
 wire sum1,and1,and2;
 xor sum_1(sum1,a,b);
 xor finalSum(sum,sum1,cin);
 and and_1(and1,sum1,cin);
 and and_2(and2,a,b);
 or Carry(cout,and1,and2);
 
endmodule
