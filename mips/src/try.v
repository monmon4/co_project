
module try ();
	
	 reg Clk;
	reg[31:0] temp=32'h00000000;
	wire[31:0] instruction;
	INST_MEM inst (instruction, temp);
	always @(posedge Clk)
	begin
		temp = temp+4;
	end	
	
	
	initial
		begin
			Clk=0;
		end
	
		always
			#5 Clk=!Clk;
			
	   initial	
		   #100 $finish;
	

		
endmodule

			