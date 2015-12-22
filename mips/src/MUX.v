
module MUX_5 (Out, In1, In2, Sel);  
	
	input[4:0] In1, In2;
	input Sel;
	output reg[4:0] Out;
	
	
	always@(In1 or In2 or Sel)
		begin
			if (Sel == 1'b0) Out = In1;
			else Out = In2;
		end
		
endmodule


module MUX_32 (Out, In1, In2, Sel);  
	
	input[31:0] In1, In2;
	input Sel;
	output reg[31:0] Out;
	
	
	always@(In1 or In2 or Sel)
		begin
			if (Sel == 1'b0) Out = In1;
			else Out = In2;
		end
		
endmodule
