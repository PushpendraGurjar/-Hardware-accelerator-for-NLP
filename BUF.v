`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 11:41:42 PM
// Design Name: 
// Module Name: BUF
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


module tempor(
        input clk, // clock input
        input rst, // reset input
        input [9:0]d_in, // data input
        output reg [79:0] d_out // data output
          );
         
  always @(posedge clk or posedge rst) begin
       if (rst) begin
         d_out <= 80'D0;
         end
      else
     begin
          d_out<={d_in,d_out[79:10]};
    end
    end
endmodule
