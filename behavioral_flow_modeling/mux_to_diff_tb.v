module dff_mux_tb();

reg clk = 1'b0;
reg D;
wire Q;

always forever #5 clk = ~clk;

dff_using_mux dm (.clk(clk),.D(D),.Q(Q));


initial 
    $monitor ("time=%t,D=%b,Q=%b",$time,D,Q);
initial begin 
    D=1'b0;
    #3 D=1'b1;
    #20 D=1'b0;
    #22 D = 1'b1;
    #500 $finish;
end 

endmodule 
