module SHIFT_LEFT (Clk, Si, In5);

input In5, Clk;
wire In5, Clk;
output reg Si;

always @(posedge Clk)
assign Si =  In5 * 2;

endmodule
