////////////////////////////////////// Simple Clock Gen (50% Duty Cycle) 
module simple_clk_gen (output reg clk);

initial 
    clk = 1'b0;

always forever #5 clk = ~clk;

endmodule 

///////////////////////////////////// 70% Duty Cycle Clock
module clock_70(output reg clk_70);

parameter clock_on = 30,clock_off = 70;

initial 
    clk_70 = 1'b0;

initial forever 
begin 
    #clock_on clk_70 = 1'b1;
    #clock_off clk_70 = 1'b0;
end 
endmodule

///////////////////////////////////////////////////////////// Under Review
///////////////////////////////////// Custom Duty Cycle Clock 
module Custom_clock (
    input [6:0] duty_cycle,
    output reg clock
);

initial begin

    clock = 1'b0;

    forever begin

        #(100-duty_cycle)
        clock = 1'b1;

        #(duty_cycle)
        clock = 1'b0;

    end

end

endmodule
////////////////////////////////////////// Custom_clock Test
module Custom_clock_tb();

reg [6:0] duty_cycle;
wire clock;

Custom_clock dut (.duty_cycle(duty_cycle) , .clock(clock));

initial 
    $monitor ("time=%t,duty_cycle = %d,clock=%b",$time,duty_cycle,clock);

initial begin 
         duty_cycle = 20;

    #500 duty_cycle = 70;

    #500 duty_cycle = 50;

    #500 $finish;
end 
//Output is not showing the desired output , the $monitor stops after 2 simulations 

endmodule 


    
