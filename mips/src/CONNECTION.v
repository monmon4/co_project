module CONNECTION (Clk);
	
	input Clk;
	
	wire pc_inst, inst_control, inst_readreg1, inst_readreg2, inst_writereg, inst_signextend ; //instruction memory wires
	wire[31:0] temp; //inst.mem output
	wire mux_writereg, control_reg, datamem_reg, regread1_alu, regread2_alu; //register wires
	wire alu_mem, readdatamem_mux, control_memread, control_memwrite; //data memory wires
	
	INST_MEM inst_mem(pc_inst, Clk, temp);
	
	assign inst_control = temp[31:26];
	assign inst_readreg1 = temp[25:21];
	assign inst_readreg2 = temp[20:16];
	assign inst_writereg = temp[15:11];
	assign inst_signextend = temp[15:0];
	
	MUX mux_inst_reg(inst_readreg2, inst_writereg,/*from control unit*/ , mux_writereg);
	REG register(inst_readreg1, inst_readreg2,control_reg, mux_writereg, datamem_reg, Clk, regread1_alu, regread2_alu );
	
	DATA_MEM data_mem(alu_mem, regread2_alu, Clk, control_memread, control_memwrite, readdatamem_mux);
	MUX mux_mem_reg( alu_mem, readdatamem_mux ,/*from control unit*/,datamem_reg);
	
	

endmodule
