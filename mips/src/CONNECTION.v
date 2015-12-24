module CONNECTION ();
	
	reg Clk;
	// very important to specify the size of the wiresssss
	
	/*instruction memory wires*/
	wire[31:0] pc_inst; wire [5:0] inst_aluctrl, inst_control; wire[15:0] inst_signextend ;
	wire[4:0]  inst_readreg1, inst_readreg2, inst_writereg; wire[25:0] inst_shiftleft;  
	wire[31:0] temp; //inst.mem output	
	
	/*register wires*/
	wire[4:0] mux_writereg;	                    
	wire reg_write;
	wire[1:0] reg_dst;				   // register wires from control unit
	wire[31:0] datamem_reg, regread1_alu, regread2_alu; 
	
	/*alu control wires*/
	wire[2:0] alu_op;			
	/*alu wires*/
	wire[31:0] mux_aluin2, signextend_alu;  
	wire alusrc, alu_and;				  
	wire[2:0] alucontrol;
	
	/*data memory wires*/
	wire[31:0] alu_mem, readdatamem_mux; 
	wire memread, memwrite;//data memory wires from control unit
	wire[1:0] mem_to_reg; //data memory wires from control unit	
	
	/*PC wires*/
	wire [31:0] shift_add, add2_pc, add1_pc, mux_pc;
	wire and_muxpc, branch;
	
	/*jump components wires*/
	wire[1:0] jump;
	wire[25:0] jump_address1;
	wire[5:0] jump_address2;
	reg[31:0] jump_address;
	wire[31:0] mux_jmpmux;
	//--------------------------------------------------------
	
	INST_MEM inst_mem(temp, pc_inst);
	
	/*all to divide the instruction*/
	assign inst_control = temp[31:26];	
	assign inst_readreg1 = temp[25:21];
	assign inst_readreg2 = temp[20:16];
	assign inst_writereg = temp[15:11];
	assign inst_signextend = temp[15:0];
	assign inst_aluctrl = temp[5:0];
	assign inst_shiftleft = temp[25:0];	//for jal
	
	ControlUnit control_unit (inst_control, inst_aluctrl, reg_write, reg_dst, memread, memwrite, alu_op, alusrc, branch, mem_to_reg,jump);
	
	MUX3_5 mux_inst_reg(mux_writereg, inst_readreg2, inst_writereg,31,reg_dst);
	REG register(regread1_alu, regread2_alu, inst_readreg1, inst_readreg2,reg_write, mux_writereg, datamem_reg, Clk );
	
	ALU_CTRL alu_ctrl(alucontrol, inst_aluctrl, alu_op) ;
	
	MUX_32 mux_reg_alu (mux_aluin2, regread2_alu, signextend_alu, alusrc );
	ALU alu (alu_mem, alu_and, regread1_alu, mux_aluin2, alucontrol) ;
	
	DATA_MEM data_mem(readdatamem_mux, alu_mem, regread2_alu, Clk, memread, memwrite);
	MUX3_32 mux_mem_reg(datamem_reg, alu_mem, readdatamem_mux, add1_pc, mem_to_reg);
	
	/*for jr and jal*/
	SHIFT_LEFT shift_forjump( jump_address1, inst_shiftleft);
	assign jump_address2=add1_pc[31:26];
	always @(jump_address1 or jump_address2)
		begin
	 	jump_address[25:0]=jump_address1;
		jump_address[31:26]=jump_address2;
		end
	
	MUX3_32 mux_mux_pc(mux_pc, mux_jmpmux, jump_address, regread1_alu, jump);
	
	/*PC Structure*/
	SIGN_EXT sign_ext(signextend_alu,inst_signextend);
	SHIFT_LEFT shift_left(shift_add, signextend_alu);
	ADD add2(add2_pc, shift_add, add1_pc); 
	ADD add1(add1_pc, pc_inst, 4);	
	MUX_32 mux_add_pc (mux_jmpmux, add1_pc, add2_pc, and_muxpc );
	PC pc(Clk, mux_pc, pc_inst);
	AND and_gate(and_muxpc, branch, alu_and);
	
	
		
		
	
	initial
		begin
		Clk = 0;
	   end
	 always
		#10 Clk=!Clk;

endmodule
