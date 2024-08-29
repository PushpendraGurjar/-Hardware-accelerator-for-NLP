module MIM(out,en,addr, clk);
output[7:0] out;
input[2:0] addr;
input en,clk;
reg [7:0] out;
reg [7:0] ROM[7:0];
reg [2:0] addr_tmp;
always @(posedge clk)
begin
ROM[0]<=8'D0;
ROM[1]<=8'D1;
ROM[2]<=8'D2;
ROM[3]<=8'D3;
ROM[4]<=8'D4;
ROM[5]<=8'D5;
ROM[6]<=8'D6;
ROM[7]<=8'D7;
if(!en)
out<=8'b0;
else
begin
out=ROM[addr_tmp];
addr_tmp=addr;
end
end
endmodule