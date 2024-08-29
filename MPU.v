module MPU(clk,start,rst,IB_rst,AR_rst,R_en,DR_rst,IR_rst,in,comp,IB_wen,IB_ren,
buf_empty, buf_full,S_en,V_en,R_am,W_am,R_addr,W_addr,data_in_comp,data_out_u1,data_out_u2,add,sub,mul,compare,shift,
sfmx,root,exp,data_out1,data_out2,data_user);
input clk,start,rst;
input IB_rst,AR_rst,R_en,DR_rst,IR_rst;
input [12:0]in;
input IB_wen,IB_ren;
input comp;
//input clk,comp,rst;
//input [17:0]in;
input [63:0]data_in_comp,data_out_u1,data_out_u2;

output  add,sub,mul,compare,shift,sfmx,root,exp;
output  [4:0]R_addr,W_addr;
output  [1:0]R_am,W_am;
output  S_en,V_en;
output buf_empty, buf_full;
//
output [63:0]data_out1,data_out2,data_user;
wire  [17:0]out;
wire done;
wire [63:0]data_mem,data_vrf,data_user,data_out_mem1,data_out_mem2,data_out_vrf1,data_out_vrf2;

Fetch_cycle F(clk,rst,in,done,start,out,IB_rst,AR_rst,R_en,DR_rst,IR_rst,IB_wen,IB_ren);
Decode_cycle D(clk,rst,comp,out,buf_empty, buf_full,S_en,V_en,R_am,W_am,R_addr,W_addr,add,sub,mul,compare,shift,sfmx,root,exp);
main_mem  M(clk,rst,R_am,W_am,R_addr,W_addr,data_mem,data_out_mem1,data_out_mem2);
vrf   V(clk,rst,R_am,W_am,R_addr,W_addr,data_vrf,data_out_vrf1,data_out_vrf2);
lsu L (clk,rst,R_am,W_am,data_in_comp,data_out_mem1,data_out_mem2,data_out_vrf1,data_out_vrf2,data_out_u1,data_out_u2,data_out1,data_out2,data_user,data_mem,data_vrf);
endmodule