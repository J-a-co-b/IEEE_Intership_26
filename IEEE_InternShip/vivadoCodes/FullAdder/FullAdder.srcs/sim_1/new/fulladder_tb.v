`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 11:33:59
// Design Name: 
// Module Name: fulladder_tb
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


module fulladder_tb;
reg a,b,cin;
wire sum,cout;

Full_adder DUT(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
a=0;b=0;cin=0; #10;
a=0;b=0;cin=1; #10;
a=0;b=1;cin=0; #10;
a=0;b=1;cin=1; #10;
a=1;b=0;cin=0; #10;
a=1;b=0;cin=1; #10;
a=1;b=1;cin=0; #10;
a=1;b=1;cin=1; #10;
$finish;
end

endmodule
