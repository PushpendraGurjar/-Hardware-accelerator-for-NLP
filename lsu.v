`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:32:49 AM
// Design Name: 
// Module Name: lsu
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


module lsu(clk,rst,R_am,W_am,data_in_comp,data_out_mem1,data_out_mem2,data_out_vrf1,data_out_vrf2,data_out_u1,data_out_u2,data_out1,data_out2,data_user,data_mem,data_vrf);
input clk,rst;
input [1:0]R_am,W_am;
input [63:0]data_in_comp,data_out_mem1,data_out_mem2,data_out_vrf1,data_out_vrf2,data_out_u1,data_out_u2;
output reg [63:0]data_out1,data_out2,data_user,data_mem,data_vrf;                             //data_user,mem,vrf:output after computation,data_out1,2:data to compute unit


always@(posedge clk)begin
      if(rst)
      begin
      data_out1<=63'h0000000000000000;
      data_out2<=63'h0000000000000000;
      end
      else if(R_am==2'b00)begin
      data_out1<=data_out_mem1;
      data_out2<=data_out_mem2;
      end 
      else if(R_am==2'b01)begin
      data_out1<=data_out_vrf1;
      data_out2<=data_out_vrf2;      
      end
      else if(R_am==2'b10)begin
      data_out1<=data_out_u1;
      data_out2<=data_out_u2;
      end
      else begin
      data_out1<=data_out1;
      data_out2<=data_out2;
      end  
  end    
always@(posedge clk)begin      
     if(W_am==2'b00)
      data_mem<=data_in_comp;
     else
      data_mem<=data_mem;
     if(W_am==2'b01)
      data_vrf<=data_in_comp;
      else
      if(W_am==2'b10 || W_am==2'b11 )
      data_user<=data_in_comp;
      else
      data_user<=data_user;

  end    
endmodule
