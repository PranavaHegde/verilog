module sync_fifo(clk,rst,rd_en,wr_en,rd_en,data_out,data_in);

input clk,rst;
input rd_en,wr_en;
input [3:0] data_in;
output reg [3:0]  data_out;

reg [3:0] mem [7:0];
reg [2:0] rd_ptr,wr_ptr;
wire full,empty;
reg [2:0]count;
parameter max = 8;

assign full = (count == max)? 1:0;
assign empty = (count == 1'b0)? 1:0;


always @(posedge clk or negedge rst) begin 
    if (!rst)
        wr_ptr<= 4'b0;

    else if (wr_en && !full) begin 
        mem[wr_ptr] <= data_in;
        wr_ptr = wr_ptr+1;
    end 
    else 
        wr_ptr <= wr_ptr;
        mem[wr_ptr] <= mem[wr_ptr];
        
end 

always @(posedge clk or negedge rst) begin 
    if (!rst)
        data_out <=4'b0;
    else if (rd_en && !empty) 
    begin
        data_out<=mem[rd_ptr];
        rd_ptr = rd_ptr + 1;
    end 
    else 
    begin
        mem[rd_ptr]<=mem[rd_ptr];
        rd_ptr <= rd_ptr;
    end 
end 

always @(posedge clk or negedge rst) begin 
    if (!rst)
        count <=0;
    else if (wr_en && full ==1'b0)
        count <= count + 1'b1 ;
    else if (rd_en && empty == 1'b0)
        count <= count - 1'b1;
    else 
        count <= count;
end 
endmodule 












  
module sync_fifo_tb;
reg clk=0,rst=1;
reg [3:0] data_in;
reg wr_en;
reg rd_en;
wire [3:0] data_out;

always #5 clk=~clk;

sync_fifo fifo1( .data_in(data_in), .data_out(data_out), .wr_en(wr_en), .rd_en(rd_en), .clk(clk), .rst(rst));

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
