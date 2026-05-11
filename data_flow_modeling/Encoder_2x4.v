module encoder_2x4(input [3:0] e_in,
                   output [0:1] e_out);

assign e_out[0] = e_in[1] | e_in[3];
assign e_out[1] = e_in[2] | e_in[3];

endmodule 


module encoder_2x4_tb;
reg [0:3]e_in;
wire [0:1] e_out;

encoder_2x4 enc (e_in,e_out);

initial 
    $monitor("e_in=%b,e_out=%b",e_in,e_out);

initial begin 
       e_in=4'b1000;
    #5 e_in = 4'b0100;
    #5 e_in = 4'b0010;
    #5 e_in = 4'b0001;
end 
endmodule 
