module gray_to_bin(input [2:0] gray,
                   output [2:0] binary);


assign binary[2] = gray[2];
assign binary [1] = gray[2] ^ gray[1];
assign binary [0] = binary[1] ^ gray [0];

endmodule 


module gray_to_bin_tb();
reg [2:0] gray;
wire [2:0]binary;

gray_to_bin dut (gray,binary);

initial 
    $monitor("gray=%b,binary=%b",gray,binary);

initial begin
       gray = 3'b010;
    #5 gray = 3'b110;
    #5 gray = 3'b111;
end 
endmodule
