
module INST_MEM (Instruction, Read_address);
	
	input [31:0] Read_address;
	output reg [31:0] Instruction;
	
	reg[7:0] the_file[159:0];
	reg [31:0] to_assign;
	
	 
	
	always @ (Read_address)
		begin
		 	Instruction[31:24] = the_file[Read_address];
			Instruction[23:16] = the_file[Read_address+1];
			Instruction[15:8] = the_file[Read_address+2];
			Instruction[7:0] = the_file[Read_address+3];
		end
	
		
	
	initial
		begin
			$readmemh("instructions.list", the_file);
		end		

endmodule


	
