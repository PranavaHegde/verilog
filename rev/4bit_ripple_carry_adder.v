module full_adder(a,b,c,sum,co);
input a,b,c;
output sum,co;

assign sum = a ^ b ^ c;
assign co = (a & b) | (b & c) | (a & c); 

endmodule

module bit_4_adder(a1,a2,a3,a4,b1,b2,b3,b4,c0,sum1,sum2,sum3,sum4,co);
input a1,a2,a3,a4;
input b1,b2,b3,b4;
input c0;
output sum1,sum2,sum3,sum4,co;
wire c1,c2,c3;

full_adder fa1 (a1,b1,c0,sum1,c1);
full_adder fa2 (a2,b2,c1,sum2,c2);
full_adder fa3 (a3,b3,c2,sum3,c3);
full_adder fa4 (a4,b4,c3,sum4,co);

endmodule

module bit_4_tb;
reg a1,a2,a3,a4,b1,b2,b3,b4;
reg c0;
wire sum1,sum2,sum3,sum4,co;

bit_4_adder b4a (a1,a2,a3,a4,b1,b2,b3,b4,c0,sum1,sum2,sum3,sum4,co);

initial begin 
    $monitor("Time=%0t: a=%b%b%b%b b=%b%b%b%b c0=%b | sum=%b%b%b%b co=%b", 
             $time, a4,a3,a2,a1, b4,b3,b2,b1, c0, sum4,sum3,sum2,sum1, co);
end 

initial begin 
    c0 = 1'b0;
    
    // Test case 1: 0000 + 0000
    {a1,a2,a3,a4} = 4'b0000;
    {b1,b2,b3,b4} = 4'b0000;
    #10;
    
    // Test case 2: 0001 + 0001 (should give 0010)
    {a1,a2,a3,a4} = 4'b0001;
    {b1,b2,b3,b4} = 4'b0001;
    #10;
    
    // Test case 3: 1010 + 0101 (should give 1111)
    {a1,a2,a3,a4} = 4'b1010;
    {b1,b2,b3,b4} = 4'b0101;
    #10;
    
    // Test case 4: 1111 + 0001 (should give 0000 with co=1)
    {a1,a2,a3,a4} = 4'b1111;
    {b1,b2,b3,b4} = 4'b0001;
    #10;
    
    $finish;
end

endmodule
