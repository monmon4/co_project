module SHIFT_LEFT ( Si, In5);

input wire [31:0] In5;

output reg [31:0]Si;

always @(In5)
	assign Si =  In5 * 4;

endmodule
