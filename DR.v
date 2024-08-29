`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:28:15 AM
// Design Name: 
// Module Name: DR
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


module DR(clock,rst, data_in, data_out);

input             clock,rst;
input      [7:0] data_in;
output reg [7:0] data_out;
reg [7:0]register;
always @(posedge clock)
begin
if(rst)
begin
data_out<= 8'bX;
end
else
begin
  
     data_out = register;
     register = data_in;

end
end
endmodule
