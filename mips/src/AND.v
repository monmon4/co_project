module AND (Out, In1, In2);

input wire In1, In2;
output reg Out;

always @(In1 or In2)
	begin
		Out = In1 & In2;
	end	

endmodule
