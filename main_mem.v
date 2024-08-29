`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 05:57:54 PM
// Design Name: 
// Module Name: main_mem
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
//output  [4:0]R_addr,W_addr;
//output  [1:0]R_am,W_am;

module main_mem(clk,rst,R_am,W_am,R_addr,W_addr,data_in,data_out1,data_out2);
input clk,rst;
input [1:0]R_am,W_am;
input [4:0]R_addr,W_addr;
input [63:0]data_in;
output reg [63:0]data_out1,data_out2;
reg [63:0]ram_block[0:31];

always@(posedge clk)begin
      if(rst)
      begin
      data_out1<=63'h0000000000000000;
      data_out2<=63'h0000000000000000;
      end
      else if(R_am==2'b00)begin
      data_out1<=ram_block[R_addr];
              if(R_addr==5'b11111) 
              data_out2<=ram_block[0];
              else
              data_out2<=ram_block[R_addr+1];
      end
      else begin
      data_out1<=data_out1;
      data_out2<=data_out2;                   //\\read from here    to compute unit
      end
          end 
      
always@(posedge clk)begin      
     if(W_am==2'b00)
           ram_block[W_addr]<=data_in; 
     else  
          ram_block[W_addr]<=ram_block[W_addr];      //\\write here from compute unit
      end   
endmodule
