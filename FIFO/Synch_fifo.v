module SIMPLE_SYNC_FIFO_CIRCULAR(data_in,data_out,wr_en,rd_en,clk,rst);
input [3:0] data_in ;
output reg [3:0] data_out;
input wr_en,rd_en,clk,rst;

wire full,empty;
reg [3:0] mem [7:0];
reg [2:0] rd_ptr;
reg [2:0] wr_ptr;
integer count;
parameter max=8;

assign full=(count==max)?1:0;
assign empty=(count==0)?1:0;

always @(posedge clk or negedge rst) begin:write_ptr
 if(!rst)
  wr_ptr<=3'b0;
 else if (wr_en && !full)begin
   wr_ptr=(wr_ptr+1)%max; 
   mem[wr_ptr]<=data_in;  
   end 
 else 
   wr_ptr<=wr_ptr;
   mem[wr_ptr]<=mem[wr_ptr];
end:write_ptr 


always @(posedge clk or negedge rst) begin:read_ptr
 if(!rst)
  rd_ptr<=3'b0;
 else if (rd_en && !empty) begin
   rd_ptr=(rd_ptr+1)%max; 
   data_out<=mem[rd_ptr]; 
  end  
 else 
   rd_ptr<=rd_ptr;
   data_out<=data_out;
end:read_ptr 

always@(posedge clk or negedge rst) begin:count_block
if (!rst)
  count<=0;
else if (wr_en==1 && full==0)
  count<=count+1;
else if (rd_en==1 && empty==0)
  count<=count-1;

end:count_block

endmodule 

///////////////////                                                     TEST BENCH FOR CIRCULAR SYNC FIFO                                                                                       // 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
module SIMPLE_SYNC_FIFO_CIRCULAR_tb;
reg clk=0,rst=1;
reg [3:0] data_in;
reg wr_en;
reg rd_en;
wire [3:0] data_out;

always #5 clk=~clk;

SIMPLE_SYNC_FIFO_CIRCULAR fifo1( .data_in(data_in), .data_out(data_out), .wr_en(wr_en), .rd_en(rd_en), .clk(clk), .rst(rst));

initial begin
rst=0;
#3 rst=1;
wr_en=1;rd_en=0;
#37 wr_en=0;rd_en=1;
end
initial begin
data_in=0;
#12 data_in=12;
#10 data_in=4;
#10 data_in=7;
#10 data_in=13;
#10 data_in=9;
#10 data_in=11;
#10 data_in=5 ;
#10 data_in=15;
#10 data_in=6;
end
endmodule
