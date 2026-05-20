module fsm_11011(input clk,
                 input input_bit,
                 input rst,
                 output reg out);
          
reg [2:0] state;
reg [2:0] next_state;

parameter s1=3'b000,s2=3'b001,s3=3'b010,s4=3'b011,s5=3'b100;

//////////////////////////////////////////////////////next_state Calculator 
always @(*) begin    
case (state) 
   s1:
     next_state = (input_bit)?s2:s1;
   s2:
      next_state = (input_bit)?s3:s1;
   s3:
      next_state = (input_bit)?s3:s4;
   s4:
      next_state = (input_bit)?s5:s1;
   s5:
      next_state = (input_bit)?s3:s1;
    default:
    next_state = s1;
endcase 
end 

///////////////////////////////////////////////////present_state calculator 
always @(posedge clk or negedge rst)
begin
    if (!rst)
        state <= s1;
    else 
        state <=next_state;
end 

////////////////////////////////////////////////////output_calculator 
always @(posedge clk) begin 
if (state == s5 && (input_bit))
    out <= 1'b1;
else 
     out <= 1'b0;
end 

endmodule
