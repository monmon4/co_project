module DATA_MEM (Read_data, Address, Write_data, Clk, Mem_read, Mem_write);
	input [31:0]Address, Write_data;
	input Mem_read, Mem_write, Clk;
	output [31:0] Read_data;
	
	reg [31:0] a_file[999:0];
	reg  [31:0] to_assign;
	
	assign Read_data = to_assign;
	
	always @(posedge Clk)
	begin
		if (Mem_read)
			to_assign =	a_file[Address];
		else if (Mem_write)
			a_file[Address] <= Write_data;
	end	
	
	initial
		begin
			$readmemh("initial memory.txt", a_file);
		end	

endmodule
