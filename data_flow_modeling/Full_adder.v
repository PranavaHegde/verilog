module Full_adder(input A,
                  input B,
                  input Cin,
                  output Cout,
                  output Sum);

 assign Sum = A ^ B ^ Cin;
 assign Cout = ((A&Cin) + B & (A^Cin));

 endmodule 


 module Full_Adder_tb();
 reg A,B,Cin;
 wire Sum,Cout;

 Full_adder fa (A,B,Cin,Cout,Sum);

 initial 
     $monitor("A=%b,B=%b,Cin=%b,Sum=%b,Cout=%b",A,B,Cin,Sum,Cout);

 initial begin 
           A=1'b0;B=1'b0;Cin=1'b0;
       #5  A=1'b0;B=1'b0;Cin=1'b1;
       #5  A=1'b0;B=1'b1;Cin=1'b0;
       #5  A=1'b0;B=1'b1;Cin=1'b1;
       #5  A=1'b1;B=1'b0;Cin=1'b0;
       #5  A=1'b1;B=1'b0;Cin=1'b1; 
       #5  A=1'b1;B=1'b1;Cin=1'b0;   
       #5  A=1'b1;B=1'b1;Cin=1'b1;
end 
endmodule 
