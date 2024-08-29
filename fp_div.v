`timescale 1ns / 1ps
module fp_div  (a,x,y);
input [15:0]a,x;
output [15:0]y;

wire [31:0]y1;
wire  [15:0]d,z0,z1,z2,z3,z4;
wire [31:0]T1,T2;
wire [4:0]i;

shift s1(x,d,i);

assign T1= 16'h01e1*d;
assign T2=32'h0002d2d2-T1;


assign z0=T2[23:8];
nr n1(z0,d,z1);
nr n2(z1,d,z2);
nr n3 (z2,d,z3);
nr n4(z3,d,z4);

assign y1= (a>>i)*z4 ;
assign y=y1[23:8];  
endmodule
