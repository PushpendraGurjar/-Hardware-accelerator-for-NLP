`timescale 1ns / 1ps
module nr(
input [15:0]z0,d,
output[15:0]z1);
wire [31:0]temp,temp2;
wire [15:0]temp1;
assign temp = d*z0;
assign temp1=16'h0200-temp[23:8];
assign temp2 =temp1*z0;
assign z1= temp2[23:8];
endmodule

 