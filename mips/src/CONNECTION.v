module CONNECTION ();
	
	reg Clk;
	  // very important to specify the size of the wiresssss
	wire[31:0] pc_inst; wire [5:0] inst_aluctrl, inst_control; wire[15:0] inst_signextend ;//instruction memory wires
	wire[4:0]  inst_readreg1, inst_readreg2, inst_writereg;  //instruction memory wires
	wire[31:0] temp; //inst.mem output	
	
	wire[4:0] mux_writereg;	                    //register wires
	wire reg_write, reg_dst;				   // register wires from control unit
	wire[31:0] datamem_reg, regread1_alu, regread2_alu; //register wires
	
	wire[2:0] alu_op;			//alu control wires
	
	wire[31:0] mux_aluin2, signextend_alu;  //alu wires
	wire alusrc, alu_and;				  //alu wires
	wire[2:0] alucontrol;	//alu wires
	
	wire[31:0] alu_mem, readdatamem_mux;  //data memory wires
	wire memread, memwrite,  mem_to_reg; //data memory wires from control unit	
	
	/*PC wires*/
	wire [31:0] shift_add, add2_pc, add1_pc, mux_pc;
	wire and_muxpc, branch; 
	//--------------------------------------------------------
	
	INST_MEM inst_mem(temp, pc_inst);
	
	assign inst_control = temp[31:26];	//all to divide the instruction
	assign inst_readreg1 = temp[25:21];
	assign inst_readreg2 = temp[20:16];
	assign inst_writereg = temp[15:11];
	assign inst_signextend = temp[15:0];
	assign inst_aluctrl = temp[5:0];
	
	ControlUnit control_unit (inst_control, reg_write, reg_dst, memread, memwrite, alu_op, alusrc, branch, mem_to_reg);
	
	MUX_5 mux_inst_reg(mux_writereg, inst_readreg2, inst_writereg,reg_dst);
	REG register(regread1_alu, regread2_alu, inst_readreg1, inst_readreg2,reg_write, mux_writereg, datamem_reg, Clk );
	
	ALU_CTRL alu_ctrl(alucontrol, inst_aluctrl, alu_op) ;
	
	MUX_32 mux_reg_alu (mux_aluin2, regread2_alu, signextend_alu, alusrc );
	ALU alu (alu_mem, alu_and, regread1_alu, mux_aluin2, alucontrol) ;
	
	DATA_MEM data_mem(readdatamem_mux, alu_mem, regread2_alu, Clk, memread, memwrite);
	MUX_32 mux_mem_reg(datamem_reg, alu_mem, readdatamem_mux , mem_to_reg);
	
	/*PC Structure*/
	SIGN_EXT sign_ext(signextend_alu,inst_signextend);
	SHIFT_LEFT shift_left(shift_add, signextend_alu);
	ADD add2(add2_pc, shift_add, add1_pc); 
	ADD add1(add1_pc, pc_inst, 4);	
	MUX_32 mux_add_pc (mux_pc, add1_pc, add2_pc, and_muxpc );
	PC pc(Clk, mux_pc, pc_inst);
	AND and_gate(and_muxpc, branch, alu_and);
	
	initial
		begin
		Clk = 0;
	   end
	 always
		#10 Clk=!Clk;

endmodule
