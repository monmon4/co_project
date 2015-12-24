module SHIFT_LEFT ( Si, In5);

input wire [31:0] In5;

output reg [31:0]Si;

always @(In5)
	assign Si =  In5 * 4;

endmodule


module SHIFT_LEFT_JUMP ( Si, In5);

input wire [25:0] In5;

output reg [25:0]Si;

always @(In5)
	assign Si =  In5 * 4;

endmodule

