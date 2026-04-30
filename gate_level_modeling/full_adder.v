module full_adder(a,b,c,co,sum);
input a,b,c;
output co,sum;
wire w1,w2,w3,w4;

xor x1 (w1,a,b);
xor x2 (sum,w1,c);
xor x3 (w2,c,a);
and a1 (w3,w2,b);
and a2  (w4,a,c);
or o1 (co,w4,w3);

endmodule 

module full_adder_tb;
reg a,b,c;
wire co,sum;

wire w1,w2,w3,w4;

full_adder fa (a,b,c,co,sum);

initial 
    $monitor("a=%b,b=%b,cin=%b,sum=%b,co=%b",a,b,c,sum,co);
initial begin
        a=1'b0;b=1'b0;c=1'b0;
   #10  a=1'b0;b=1'b0;c=1'b1; 
   #10  a=1'b0;b=1'b1;c=1'b0;
   #10  a=1'b0;b=1'b1;c=1'b1; 
   #10  a=1'b1;b=1'b0;c=1'b0;
   #10  a=1'b1;b=1'b0;c=1'b1;
   #10  a=1'b1;b=1'b1;c=1'b0; 
   #10  a=1'b1;b=1'b1;c=1'b1;
   end 
endmodule 


