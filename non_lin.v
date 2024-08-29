`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 10:39:38 PM
// Design Name: 
// Module Name: non_lin
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


module non_lin(
input [15:0]x,v,
input clk,rst,
output reg [15:0]v1);

reg [15:0]x_temp[4:0];
reg [15:0]v_temp[4:0];
reg [15:0]num,den;
wire [15:0]del;
reg[2:0] cnt,i;
reg [31:0]v_fin,v_fin1,v_fin2;
fp_div divide(num,den,del);

always @(posedge clk)
begin
    if(rst==0)
        begin
            if(cnt!=3'b101)
                begin
                    x_temp[cnt]<=x;
                    cnt<=cnt+1;
                    if(cnt!=3'b100) v_temp[cnt]<=v;           
                end  
                      
            else if(cnt==3'b101)
            begin
//                cnt<=cnt-1;
                    for(i=1;i<=4;i=i+1)
                        begin
                        if((x_temp[i-1]<x_temp[cnt-1])&&(x_temp[cnt-1]< x_temp[i]))
                        begin  
                        num <=x_temp[cnt-1]-x_temp[i-1];
                        den<=(x_temp[i]-x_temp[i-1]);    
                         
                        v_fin1<= (16'h0100-del)*v_temp[i-1];
                        
                        v_fin2<= del*v_temp[i];
                        
                        v_fin=v_fin1+v_fin2;
                         v_temp[cnt-1]<= v_fin[23:8];
                        v1<=v_temp[cnt-1];                                                     
                        end
                        end  
                        
             end        
             end
          
    else 
     cnt<=0;
end

endmodule
