`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 01:02:28 AM
// Design Name: 
// Module Name: Decode_cycle
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


module Decode_cycle(clk,rst,comp,in,buf_empty, buf_full,S_en,V_en,R_am,W_am,R_addr,W_addr,add,sub,mul,compare,shift,sfmx,root,exp);
input clk,comp,rst;
input [17:0]in;
output reg add,sub,mul,compare,shift,sfmx,root,exp;
output  reg[4:0]R_addr,W_addr;
output  reg[1:0]R_am,W_am;
output reg S_en,V_en;
output buf_empty, buf_full;
reg [2:0]opcode;
reg S_V;
wire [17:0]out;
pipe p( clk, rst, in, out,comp, buf_empty, buf_full, fifo_counter );

always@(posedge clk)
begin
if(rst)
begin
W_addr <= 0;
R_addr <= 0;
W_am <= 0;
R_am <= 0;
S_V<=0;
opcode<=0;
S_en<= 0;
V_en<= 0;
end
else
begin
W_addr <= out[4:0];
R_addr <= out[9:5];
W_am <= out[11:10];
R_am <= out[13:12];
S_V<=out[17];
opcode<=out[16:14];
S_en<= out[17];
V_en<= ~out[17];
end
end

always@(posedge clk)
begin
if(rst)
begin
add<=0;
sub<=0;
mul<=0;
compare<=0;
shift<=0;
sfmx<=0;
root<=0;
exp<=0;
end
else
begin
case(out[16:14])
3'D0:
begin
add<=1;
sub<=0;
mul<=0;
compare<=0;
shift<=0;
sfmx<=0;
root<=0;
exp<=0;
end
3'D1:
begin
add<=0;
sub<=1;
mul<=0;
compare<=0;
shift<=0;
sfmx<=0;
root<=0;
exp<=0;
end
3'D2:
begin
add<=0;
sub<=0;
mul<=1;
compare<=0;
shift<=0;
sfmx<=0;
root<=0;
exp<=0;
end
3'D3:
begin
add<=0;
sub<=0;
mul<=0;
compare<=1;
shift<=0;
sfmx<=0;
root<=0;
exp<=0;
end
3'D4:
begin
add<=0;
sub<=0;
mul<=0;
compare<=0;
shift<=1;
sfmx<=0;
root<=0;
exp<=0;
end
3'D5:
begin
add<=0;
sub<=0;
mul<=0;
compare<=0;
shift<=0;
sfmx<=1;
root<=0;
exp<=0;
end
3'D6:
begin
add<=0;
sub<=0;
mul<=0;
compare<=0;
shift<=0;
sfmx<=0;
root<=1;
exp<=0;
end
3'D7:
begin
add<=0;
sub<=0;
mul<=0;
compare<=0;
shift<=0;
sfmx<=0;
root<=0;
exp<=1;
end
default:
begin
add<=0;
sub<=0;
mul<=0;
compare<=0;
shift<=0;
sfmx<=0;
root<=0;
exp<=0;
end
endcase
end
end
endmodule
