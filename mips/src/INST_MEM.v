
module INST_MEM (Read_address, Clk, Instruction);
	
	input [31:0] Read_address;
	input Clk;
	output [31:0] Instruction;
	
	reg [31:0] temp[31:0];
	reg [31:0] to_assign;
	
	assign Instruction = to_assign;
	
	always @(posedge Clk)
	begin
		 to_assign = temp[Read_address];
	end	

endmodule


	
