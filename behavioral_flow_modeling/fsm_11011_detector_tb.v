module fsm_11011_tb ();

reg clk = 1'b0;
reg rst,input_bit;
wire out;

always forever #5 clk = ~clk;

fsm_11011 fsm (.clk(clk),.rst(rst),.input_bit(input_bit),.out(out));

initial
    $monitor("time=%0t clk=%b in=%b state=%b next=%b out=%b",$time,clk,input_bit,fsm.state,fsm.next_state,out);
initial begin
       rst = 1'b0;
       input_bit = 1'b0;
    #12 rst = 1'b1;

    @(negedge clk) input_bit = 1'b0;
    @(negedge clk) input_bit = 1'b1;
    @(negedge clk) input_bit = 1'b1;
    @(negedge clk)input_bit = 1'b0;
    @(negedge clk)input_bit = 1'b1;
    @(negedge clk)input_bit = 1'b1;
    @(negedge clk)input_bit = 1'b0;
    @(negedge clk) input_bit = 1'b1;
    @(negedge clk) input_bit = 1'b1;
    @(negedge clk) input_bit = 1'b0;
    @(negedge clk) input_bit = 1'b0;
    @(negedge clk) input_bit = 1'b1;
    @(negedge clk) input_bit = 1'b0;
end 

endmodule 
