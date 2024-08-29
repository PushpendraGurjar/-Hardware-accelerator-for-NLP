`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 20:01:26
// Design Name: 
// Module Name: compare_oned
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


module compare_oned(a,b,y);

input [63:0]a;
input[63:0]b;
output reg out;
wire [15:0]a1,a2,a3,a4;
wire [15:0]b1,b2,b3,b4;
wire [15:0]ya1;
wire [15:0]yb1;
assign {a1,a2,a3,a4}=a;
assign {b1,b2,b3,b4}=b;

mag_oned ma1(.a({a1,a2,a3,a4}),.y(ya1));
mag_oned ma1(.b({b1,b2,b3,b4}),.y(yb1));

always@(*)
if(ya1>=ya2)
out=1'b1;
else
out=1'b0;

endmodule
