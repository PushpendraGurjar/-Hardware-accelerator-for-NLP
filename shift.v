`timescale 1ns / 1ps
module shift(
input [15:0]x,output  [15:0]d,output reg [4:0]i); 

wire [15:0]temp ,temp1,temp2,temp3,temp4,temp5,temp6,temp7;
 
assign temp = x>>1;
assign temp1= x>>2;
assign temp2= x>>3;
assign temp3= x>>4;
assign temp4= x>>5;
assign temp5= x>>6;
assign temp6= x>>7;
assign temp7= x>>8;

 
 
always@(*)
begin
if( temp< 16'h0100 && temp > 16'h0080)
i=4'd1;
else if(temp1<16'h0100 && temp1 > 16'h0080)
i=4'd2;
else if(temp2<16'h0100 && temp2 > 16'h0080)
i=4'd3;
else if(temp3<16'h0100 && temp3 > 16'h0080)
i=4'd4;
else if(temp4<16'h0100 && temp4 > 16'h0080)
i=4'd5;
else if(temp5<16'h0100 && temp5> 16'h0080)
i=4'd6;
else if(temp6<16'h0100 && temp6> 16'h0080)
i=4'd7; 
else if(temp7<16'h0100 && temp7> 16'h0080)
i=8; 
else
i=4'd0;
end
assign d=x>>i;
endmodule
