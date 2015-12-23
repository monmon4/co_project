
module REG (Read_data1, Read_data2, Read_reg1, Read_reg2, Reg_write, Write_reg, Write_data, Clk); 
	
	input [4:0] Read_reg1, Read_reg2, Write_reg;
	input [31:0] Write_data;
	input Clk, Reg_write;
	output reg [31:0] Read_data1, Read_data2; 
	
	reg [31:0] register[31:0];
	reg [31:0] for_write_data;
	
	  
	
	initial
	 register[0] = 0;
	
	
	//assign Read_data1 = register[Read_reg1];
	//assign Read_data2 = register[Read_reg2];
	
	always @(posedge Clk)
	begin 
		Read_data1 = register[Read_reg1];
		Read_data2 = register[Read_reg2];
		if (Reg_write && Write_reg != 5'b00000)
			begin
				//for_write_data <=  Write_data;
				#5 register[Write_reg] <= /*for_*/Write_data;
			end
			
	end	
	
	
endmodule

module REG_tb();
	 
	
	reg [4:0] read_reg1, read_reg2, write_reg;
	reg [31:0] write_data;
	reg clk, reg_write;
	wire [31:0] read_data1, read_data2; 
	
	REG for_tb(read_data1, read_data2, read_reg1, read_reg2, reg_write, write_reg, write_data, clk);
	
	initial
		begin
			clk=0;
			reg_write=1;
			read_reg1=5'b00000;
			read_reg2=5'b00000;
			write_reg=5'b01100;
			write_data=32'h0000c0a0;
			
			#24 read_reg1=5'b00000;
				read_reg2=5'b01100;
				write_reg=5'b00010;
				write_data=32'h0000000a;
			
			#24 reg_write= 0;
				read_reg1=5'b01100;
				read_reg2=5'b00010;
				write_reg=5'b10000;
				write_data=32'h00a5d604;
				
			#24 read_reg1=5'b00000;
				read_reg2=5'b10000;
			
			
			
		end
		
	always
		#10 clk=!clk;
		
	initial
		#80 $finish;

	
endmodule
