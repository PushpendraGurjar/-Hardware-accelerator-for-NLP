`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 19:15:24
// Design Name: 
// Module Name: mltply_oned
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


module mltply_oned(a,b,out);

input [63:0]a;
input[63:0]b;
output [15:0]out;
wire [15:0]a1,a2,a3,a4;
wire [15:0]b1,b2,b3,b4;
wire [31:0]y1,y2,y3,y4;
wire [15:0]ry1,ry2,ry3,ry4;
assign {a1,a2,a3,a4}=a;
assign {b1,b2,b3,b4}=b;


assign y1= a1*b1;
assign y2= a2*b2;
assign y3= a3*b3;
assign y4= a4*b4;

assign ry1 = y1>>8;
assign ry2 = y2>>8;
assign ry3 = y3>>8;
assign ry4 = y4>>8;
assign out= ry1+ry2+ry3+ry4;

endmodule