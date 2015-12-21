module SHIFT_LEFT ( Si, In5);

input wire [31:0] In5;

output reg Si;

always @(In5)
assign Si =  In5 * 2;

endmodule
