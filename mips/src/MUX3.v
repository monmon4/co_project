module MUX3 (Out,In1,In2,In3,Sel);
	input In1,In2,In3;
	input [1:0]Sel;
	output reg Out;	  
	
	always@(In1 or In2 or In3 or Sel)
		begin
			if (Sel==2'b00)
				Out=In1;
			else if (Sel==2'b01)
				Out=In2;
			else if (Sel==2'b10)
				Out=In3;
		end
endmodule



module MUX3_5 (Out, In1, In2, In3, Sel);
	input[4:0] In1,In2,In3;
	input [1:0]Sel;
	output reg[4:0] Out;	  
	
	always@(In1 or In2 or In3 or Sel)
		begin
			if (Sel==2'b00)
				Out=In1;
			else if (Sel==2'b01)
				Out=In2;
			else if (Sel==2'b10)
				Out=In3;
		end
endmodule


module MUX3_32 (Out, In1, In2, In3, Sel);
	input[31:0] In1,In2,In3;
	input [1:0]Sel;
	output reg[31:0] Out;	  
	
	always@(In1 or In2 or In3 or Sel)
		begin
			if (Sel==2'b00)
				Out=In1;
			else if (Sel==2'b01)
				Out=In2;
			else if (Sel==2'b10)
				Out=In3;
		end
endmodule


module MUX_3x1_tb;
	wire Out;
	reg In1,In2,In3;
	reg [1:0]Sel;
	initial
		begin 
			In1=3'b010;
			In2=2'b01;
			In3=3'b110;
			Sel=2'b00;
			
			#40 In1=3'b110;
				In2=2'b10;
				In3=3'b100;
				Sel=2'b01;
			
			#40 In1=3'b010;
				In2=2'b00;
				In3=3'b010;
				Sel=2'b10;
			
			
			
			#20 $finish;
		end
	endmodule
	

