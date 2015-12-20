# co_project
module PC (Clk, In1, In2, Slin2, Branch, Alu0,sum,PcSrc, Pci, Pco);

input  wire In1, In2, Slin2,Branch, Alu0, Pci, Clk; 
output reg sum,PcSrc;
output reg Pco;
// shifting the output of sign extension //
SLT (Slin2, In2, 2);
AND (PcSrc, Branch, Alu0);
ADD (Sum, Slin2, In1);
always @ (posedge Clk)
	assign Pco = Pci;
endmodule
