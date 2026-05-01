module mux4x1(i1,i2,i3,i4,sel,o);
input i1,i2,i3,i4;
input [1:0] sel;
output reg o;

always@(sel) 
begin 
    case(sel)
        2'b00:
            o=i1;
        2'b01:
            o=i2;
        2'b10:
            o=i3;
        2'b11:
            o=i4;
        default :
            o=1'bx;
    endcase 
end 
endmodule 

module mux4x1_tb;
reg i1,i2,i3,i4;
reg [1:0] sel;
wire o;

mux4x1 mux4 (i1,i2,i3,i4,sel,o);

initial 
    $monitor("i1=%b,i2=%b,i3=%b,i4=%b,sel=%b,o=%b",i1,i2,i3,i4,sel,o);

initial begin 
        i1=1'b1;i2=1'b0;i3=1'b0;i4=1'b0;sel=2'b00;
   #10  i1=1'b0;i2=1'b1;i3=1'b0;i4=1'b0;sel=2'b01;
   #10  i1=1'b0;i2=1'b0;i3=1'b1;i4=1'b0;sel=2'b10;
   #10  i1=1'b0;i2=1'b0;i3=1'b0;i4=1'b1;sel=2'b11;
 end 
endmodule 
