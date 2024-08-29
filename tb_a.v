`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2024 06:12:30 PM
// Design Name: 
// Module Name: tb_a
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


module tb_a();
reg clk,start,rst;
reg IB_rst,AR_rst,R_en,DR_rst,IR_rst;
reg [12:0]in;
reg IB_wen,IB_ren;
reg comp;
reg [63:0]data_in_comp,data_out_u1,data_out_u2;


wire add,sub,mul,compare,shift,sfmx,root,exp;
wire [4:0]R_addr,W_addr;
wire [1:0]R_am,W_am;
wire S_en,V_en;
wire buf_empty, buf_full;
wire [63:0]data_out1,data_out2,data_user;

MPU M(clk,start,rst,IB_rst,AR_rst,R_en,DR_rst,IR_rst,in,comp,IB_wen,IB_ren,
buf_empty, buf_full,S_en,V_en,R_am,W_am,R_addr,W_addr,data_in_comp,data_out_u1,data_out_u2,add,sub,mul,compare,shift,
sfmx,root,exp,data_out1,data_out2,data_user);

initial clk = 1'b0;
always #5 clk = ~clk;
initial
begin
rst =1'b1;
IB_rst = 1'b1;
AR_rst = 1'b1;
R_en = 1'b0;
DR_rst = 1'b1;
IR_rst = 1'b1;
#7
rst = 1'b0;
start = 1'b1;
IB_rst = 1'b0;
AR_rst=1'b0;
R_en=1'b1;
DR_rst=1'b0;
IR_rst=1'b0;
IB_wen = 1'b1;
IB_ren = 1'b0;
comp=1;
in = 13'D2574;
data_in_comp=64'h248791910324;data_out_u1=64'h148791910324;data_out_u2=64'h348791910324;
#10
in = 13'D7456;
#10
in = 13'D12652;
#10
in = 13'D15842;
#10
in = 13'D98512;
#10
in = 13'D65212;
#10
in = 13'D19582;
#10
in = 13'D98512;
#10
IB_wen = 1'b0;
IB_ren = 1'b1;
#10

#1000
$finish;
end
endmodule