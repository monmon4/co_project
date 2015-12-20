
module MUX (Out, In1, In2, Sel);  
	
	input In1, In2, Sel;
	output Out;
	reg Out;
	
	always@(In1 or In2 or Sel)
		begin
			if (Sel == 1'b0) Out = In1;
			else Out = In2;
		end
		
endmodule
