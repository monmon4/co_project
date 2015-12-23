module PC (Clk, Pci, Pco);

input  wire Clk	;
input wire [31:0] Pci; 
output reg [31:0] Pco;

initial
	Pco =0;
	
always @ (posedge Clk)
	#7 Pco <= Pci;
endmodule
