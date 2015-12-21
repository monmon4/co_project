module AND (Clk, Out, In1, In2);

input wire In1, In2, Clk;
output reg Out;	

always @(posedge Clk)
begin
if (In1 == 1 && In2 == 1)
	Out <= 1;
else
	Out <= 0;	
end
endmodule
