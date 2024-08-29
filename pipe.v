`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:32:10 AM
// Design Name: 
// Module Name: 
// Project Name: instruction_pointer
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


`define BUF_WIDTH 3    // BUF_SIZE = 16 -> BUF_WIDTH = 4, no. of bits to be used in pointer
`define BUF_SIZE ( 1<<`BUF_WIDTH )

module pipe( clk, rst, buf_in, buf_out,comp, buf_empty, buf_full, fifo_counter );

input                 rst, clk,comp;
reg wr_en, rd_en;   

input [17:0]           buf_in;                   

output[17:0]           buf_out;                  

output                buf_empty, buf_full;      

output[`BUF_WIDTH :0] fifo_counter;             
 

reg[17:0]              buf_out;
reg                   buf_empty, buf_full;
reg[`BUF_WIDTH :0]    fifo_counter;
reg[`BUF_WIDTH -1:0]  rd_ptr, wr_ptr;           
reg[17:0]              buf_mem[`BUF_SIZE -1 : 0]; 

always@(posedge clk)
begin
if(rst)
begin
wr_en =1'b0;
rd_en =1'b0;
end
else
begin
wr_en =1'b1;
rd_en =comp?1'b1:1'b0;
end
end 

always @(fifo_counter)
begin
   buf_empty = (fifo_counter==0);   
   buf_full = (fifo_counter== `BUF_SIZE);  
end


always @(posedge clk or posedge rst)
begin
   if( rst )
       fifo_counter <= 0;		

   else if( (!buf_full && wr_en) && ( !buf_empty && rd_en ) )  
       fifo_counter <= fifo_counter;			

   else if( !buf_full && wr_en )			
       fifo_counter <= fifo_counter + 1;

   else if( !buf_empty && rd_en )		
       fifo_counter <= fifo_counter - 1;

   else
      fifo_counter <= fifo_counter;			
end

always @( posedge clk or posedge rst)
begin
   if( rst )
      buf_out <= 0;		
   else
   begin
      if( rd_en && !buf_empty )
         buf_out <= buf_mem[rd_ptr];	
      else
         buf_out <= buf_out;		

   end
end

always @(posedge clk)
begin
   if( wr_en && !buf_full )
      buf_mem[ wr_ptr ] <= buf_in;		
   else
      buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
end

always@(posedge clk or posedge rst)
begin
   if( rst )
   begin
      wr_ptr <= 0;		
            rd_ptr <= 0;		
   end
   else
   begin
      if( !buf_full && wr_en )    
			wr_ptr <= wr_ptr + 1;		
      else  
			wr_ptr <= wr_ptr;

      if( !buf_empty && rd_en )   
			rd_ptr <= rd_ptr + 1;		
      else 
			rd_ptr <= rd_ptr;
   end

end
endmodule
