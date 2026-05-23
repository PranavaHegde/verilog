module dff_using_mux(
    input clk,
    input D,
    output reg Q
);

reg master;

always @(*)
begin
    if (~clk)
        master = D;
end

always @(*)
begin
    if (clk)
        Q = master;
end

endmodule
