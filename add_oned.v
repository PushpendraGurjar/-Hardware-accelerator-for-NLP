`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 17:34:57
// Design Name: 
// Module Name: add_oned
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


module add_oned(a,b,y);
input [63:0]a;
input[63:0]b;
output [63:0]y;
wire [15:0]a1,a2,a3,a4;
wire [15:0]b1,b2,b3,b4;
wire [15:0]y1,y2,y3,y4;
assign {a1,a2,a3,a4}=a;
assign {b1,b2,b3,b4}=b;
assign y4=a4+b4;
assign y3=a3+b3;
assign y2=a2+b2;
assign y1=a1+b1;

assign y= {y1,y2,y3,y4};
endmodule
