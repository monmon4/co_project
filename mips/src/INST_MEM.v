
module INST_MEM (Read_address, Clk, Instruction);
	
	input [31:0] Read_address;
	input Clk;
	output [31:0] Instruction;
	
	reg[31:0] the_file[39:0];
	reg [31:0] to_assign;
	
	assign Instruction = to_assign;
	
	always @(posedge Clk)
		begin
		 	to_assign = the_file[Read_address];
		end
	
		
	
	initial
		begin
			$readmemh("instructions.txt", the_file);
		end		

endmodule


	
