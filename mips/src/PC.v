module PC (Clk, Pci, Pco);

input  wire Clk	;
input wire [31:0] Pci; 
output reg [31:0] Pco;


always @ (posedge Clk)
	assign Pco = Pci;
endmodule
