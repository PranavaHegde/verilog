module half_adder (a,b,c,sum);
input a,b;
output c,sum;

xor x1 (sum,a,b);
and a1 (c, a,b);

endmodule 


module half_adder_tb;
reg a,b;
wire c,sum;

half_adder ha (a,b,c,sum);
initial 
    $monitor ("a=%b,b=%b,c=%b,sum=%b",a,b,c,sum);
initial begin 
        a=1'b0;b=1'b0;
    #10 a=1'b0;b=1'b1;
    #10 a=1'b1;b=1'b0;
    #10 a=1'b1;b=1'b1;
end 
endmodule 


