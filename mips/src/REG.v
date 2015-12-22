
module REG (Read_data1, Read_data2, Read_reg1, Read_reg2, Reg_write, Write_reg, Write_data, Clk); 
	
	input [4:0] Read_reg1, Read_reg2, Write_reg;
	input [31:0] Write_data;
	input Clk, Reg_write;
	output [31:0] Read_data1, Read_data2; 
	
	reg [31:0] register[31:0];
	
	initial
	 register[0] = 0;
	
	
	assign Read_data1 = register[Read_reg1];
	assign Read_data2 = register[Read_reg2];
	
	always @(posedge Clk)
	begin
		if (Reg_write && Write_reg != 5'b00000)
			register[Write_reg] <= Write_data;		
	end	
	
	
endmodule