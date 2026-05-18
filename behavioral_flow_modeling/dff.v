module dff(input d,
           input clk,
           input rst,
           output reg q);


always @(posedge clk or negedge rst) begin
    if (!rst)
        q <= 1'b0;
    else 
        q <= d;
end 
endmodule 


module dff_tb();
reg clk = 1'b0;
reg rst;
reg d;
wire q;

always forever #5 clk = ~clk;

dff d_ff (.d(d),.clk(clk),.rst(rst),.q(q));

initial 
    $monitor("rst = %b , d=%b , q=%b",rst,d,q);
initial begin 
       d=1'b1;
    #2 rst = 1'b0;
    #2 rst = 1'b1;
    #8 d = 1'b1;
    #12 d = 1'b0;
  //  #2 rst = 1'b0;
  //  #2 rst = 1'b1;
end 
endmodule 
