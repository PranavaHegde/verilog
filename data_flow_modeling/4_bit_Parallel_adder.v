module Full_adder(input A,
                  input B,
                  input Cin,
                  output Cout,
                  output Sum);

 assign Sum = A ^ B ^ Cin;
 assign Cout = ((A&Cin) + B & (A^Cin));

 endmodule 

module Parallel_adder(input [3:0] A,
                      input [3:0] B,
                      output [3:0] Sum);
wire c0=1'b0;
wire c1,c2,c3,cout;

Full_adder fa0 (A[0],B[0],c0,c1,Sum[0]);
Full_adder fa1 (A[1],B[1],c1,c2,Sum[1]);
Full_adder fa2 (A[2],B[2],c2,c3,Sum[2]);
Full_adder fa3 (A[3],B[3],c3,cout,Sum[3]);

endmodule 


 module Full_Adder_tb();
 reg [3:0] A,B;
 wire [3:0] Sum;
 wire c1,c2,c3,cout;

 Parallel_adder Pa (A,B,Sum);

 initial 
     $monitor("A=%b,B=%b,Sum=%b",A,B,Sum);

 initial begin 
           A=4'b0000;B=4'b0000;
       #5  A=4'b1100;B=4'b0110;
       #5  A=4'b1010;B=4'b1111;
       #5  A=4'b0000;B=4'b1111;
       
end 
endmodule 
