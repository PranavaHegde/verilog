/////////////////////////////////////////////////////////// 2x1 MUX
module mux_2x1(a,b,sel,out);
input a,b,sel;
output out;

assign out = (sel)?a:b;
endmodule 

module mux_2x1_tb;
reg a,b,sel;
wire out;

mux_2x1 mux2 (a,b,sel,out);

initial 
    $monitor("a=%b,b=%b,sel=%b,out=%b",a,b,sel,out);

initial begin 
        a=1'b0;b=1'b0;sel=1'b1;
    #10 a=1'b1;b=1'b0;sel=1'b1;
    #10 a=1'b0;b=1'b1;sel=1'b0;
    #10 a=1'b0;b=1'b1;sel=1'b0;
    #10 a=1'bx;b=1'bz;sel=1'b1;
    #10 a=1'bx;b=1'bz;sel=1'b0;
end 
endmodule 
///////////////////////////////////////////////////////////// 4x1 MUX
module mux_4x1(input        a,b,c,d,
               input      [1:0] sel,
               output           out);
           
assign out = (sel[1])?(sel[0]?d:c):(sel[0]?b:a);
endmodule 

module mux_4x1_tb;
reg a,b,c,d;
reg [1:0] sel;
wire out;

mux_4x1 mux4 (a,b,c,d,sel,out);

initial 
    $monitor("a=%b,b=%b,c=%b,d=%d,sel=%b,out=%b",a,b,c,d,sel,out);

initial begin 
         a=1'b1;b=1'b0;c=1'bx;d=1'bz;sel=2'b00;
    #10  a=1'b1;b=1'b0;c=1'bx;d=1'bz;sel=2'b01;
    #10  a=1'b1;b=1'b0;c=1'bx;d=1'bz;sel=2'b10;
    #10  a=1'b1;b=1'b0;c=1'bx;d=1'bz;sel=2'b11;
end 
endmodule 
