`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 19:19:23
// Design Name: 
// Module Name: mag_oned
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


module mag_oned(a,out);

input [63:0]a;
output [15:0]out;
wire [15:0]a1,a2,a3,a4;
wire [31:0]y1,y2,y3,y4;
wire [15:0]ry1,ry2,ry3,ry4;
wire [15:0]temp;
assign {a1,a2,a3,a4}=a;

assign y1= a1*a1;
assign y2= a2*a2;
assign y3= a3*a3;
assign y4= a4*a4;

assign ry1 = y1>>8;
assign ry2 = y2>>8;
assign ry3 = y3>>8;
assign ry4 = y4>>8;
assign temp= ry1+ry2+ry3+ry4;

assign out= sqrt(temp);
endmodule


