module DATA_MEM (Read_data, Address, Write_data, Clk, Mem_read, Mem_write);
	input [31:0]Address, Write_data;
	input Mem_read, Mem_write, Clk;
	output reg [31:0] Read_data;
	
	reg [7:0] a_file[1999:0];
	
	
	always @(posedge Clk)
	begin
		if (Mem_read)
			begin
			#3 Read_data[31:24] =	a_file[Address];
			Read_data[23:16] =	a_file[Address+1];
			Read_data[15:8] =	a_file[Address+2];
			Read_data[7:0] =	a_file[Address+3];
			end
			
		else if (Mem_write)
			begin
			#2 a_file[Address] <= Write_data[31:24];
			a_file[Address+1] <= Write_data[23:16];
			a_file[Address+2] <= Write_data[15:8];
			a_file[Address+3] <= Write_data[7:0];
			end
	end	
	
	initial
		begin
			$readmemh("initial memory.txt", a_file);
		end	

endmodule


module DATA_MEM_tb();
	
	reg [31:0]address, write_data;
	reg mem_read, mem_write, clk;
	wire [31:0] read_data;
	
	
	DATA_MEM for_test(read_data, address, write_data, clk, mem_read, mem_write);
	
	initial
		begin
			clk = 0;
			/*writing to memory*/
			mem_write = 1;
			mem_read = 0;
			address = 32'h00000000 ; // not supposed to be taken
			write_data  = 32'h0000000A ;
			#5 address = 32'h00000004 ; // supposed to be taken
			write_data  = 32'h00000008 ;
			
			/*reading from memory*/
			#10 mem_write = 0;
			mem_read = 1;
			address = 32'h00000000;
			#14 address = 32'h00000004;
			#20 address = 32'h00000000;
			#20 address = 32'h00000008;
			
			
		end
		
	always
		#10 clk=!clk;
		
	initial
		#200 $finish;
		
	
	
		
	
endmodule
