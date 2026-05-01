module half_adder(a,b,co,sum);
input a ,b;
output co,sum;

assign co = a & b;
assign sum = a ^ b;
endmodule 

module half_adder_tb;
reg a,b;
wire co,sum;

half_adder  ha (a,b,co,sum);
initial 
    $monitor("a=%b,b=%b,co=%b,sum=%b",a,b,co,sum);
initial begin 
    a=1'b0;b=1'b0;
    #10 a=1'b0;b=1'b1;
    #10 a=1'b1;b=1'b0;
    #10 a=1'b1;b=1'b1;
end 
endmodule 

