
module INST_MEM (Instruction, Read_address);
	
	input [31:0] Read_address;
	output reg [31:0] Instruction;
	
	reg[31:0] the_file[39:0];
	reg [31:0] to_assign;
	
	 
	
	always @ (Read_address)
		begin
		 	Instruction = the_file[Read_address];
		end
	
		
	
	initial
		begin
			$readmemh("instructions.list", the_file);
		end		

endmodule


	
