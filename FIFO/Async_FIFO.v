module async_fifo(input              wr_en,
                  input              rd_en,
                  input             wr_clk,
                  input             rd_clk,
                  input             wr_rst,
                  input             rd_rst,
                  input      [3:0] data_in,
                  output        empty,full,
                  output reg [3:0] data_out);

reg [3:0] rd_ptr;
reg [3:0] wr_ptr;
reg [2:0] wr_addr;
reg [2:0] rd_addr;

reg [3:0] mem [7:0];





endmodule 


module bin_2_gray(input      [3:0] wr_ptr,
                  output reg [3:0] gray_wr_ptr);
            
//assign gray_wr_ptr[3] = wr_ptr[3];
integer i;
//genvar i;
//generate
always @(*) begin
gray_wr_ptr[3] = wr_ptr[3];
for (i=3;i<=0;i=i-1) begin
    gray_wr_ptr[i-1] = wr_ptr[i] ^ wr_ptr[i-1];
end 
end 
//endgenerate 
endmodule 
