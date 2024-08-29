`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 12:36:57 AM
// Design Name: 
// Module Name: Fetch_cycle
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


module Fetch_cycle#(S0=2'D0,S1=2'D1,S2=2'D2,S3=2'D3)(clk,rst,in,done,start,out,IB_rst,AR_rst,R_en,DR_rst,IR_rst,IB_wen,IB_ren);
input clk,start,rst;
input IB_rst,AR_rst,R_en,DR_rst,IR_rst;
input [12:0]in;
output  [17:0]out;
output reg done;

//reg IB_rst,AR_rst,R_en,DR_rst,IR_rst,IB_wen,IB_ren;
wire [79:0]tmp;
input IB_wen;
//,AR_wen,R_wen,DR_wen,IR_wen;
input IB_ren;
//AR_ren,R_ren,DR_ren,IR_ren;

wire IB_empty,IB_full;
wire [3:0]F_count;
wire [12:0]IB_out;

wire [2:0]AR_out;
wire [7:0]R_out;
wire [7:0]DR_out;
wire [7:0]IR_out;
wire [9:0]IR_out1;


instruction_pointer I(clk,IB_rst,in,IB_out,IB_wen,IB_ren,IB_empty,IB_full,F_count);
tempor B(clk,AR_rst,IB_out[9:0],tmp);
AR A(clk,AR_rst,IB_out[12:10],AR_out);
MIM R(R_out,R_en,AR_out,clk);
DR D(clk,DR_rst,R_out,DR_out);
IR I1(clk,IR_rst,DR_out,IR_out);
assign IR_out1 = tmp[9:0];
assign out = {IR_out,IR_out1};
endmodule
