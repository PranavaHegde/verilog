module mux_2x1(i1,i2,sel,o);
input i1,i2;
input sel;
output o;

assign o=sel?i1:i2;
endmodule 

module mux_2x1_2(a,b,sel,o1);
input a,b;
input sel;
output reg o1;

always@(*)
begin 
    if (sel == 1'b1)
        o1=a;
    else if (sel == 1'b0)
        o1=b;
    else 
        o1=o1;
end 
endmodule 


module mux_2x1_tb;
reg a,b,sel;
wire o1;

mux_2x1_2 mux_2 (a,b,sel,o1);

initial 
    $monitor("a=%b,b=%b,sel=%b,o1=%b",a,b,sel,o1);
initial begin
    a=1'b0;b=1'b0;sel=1'b0;
    #10 a=1'b0;b=1'b1;sel=1'b1;
    #10 a=1'b1;b=1'b0;sel=1'b0;
    #10 a=1'b1;b=1'b1;sel=1'b1;
end 
endmodule 

