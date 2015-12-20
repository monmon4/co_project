module ControlUnit (Op, RegWr, RegDst, MemRead, MemWrite, Aluop, Alusrc, Br, MemToReg);
	input [5:0] Op;
	//input  Zero;
	
	output [2:0] Aluop;
	// output [3:0] AluControl;
	output RegWr;
	output RegDst;
	output MemRead;
	output MemWrite;
	output MemToReg;
	output Alusrc;
	output Br;

	reg [2:0] Aluop;
	//reg [3:0] AluControl;
	reg RegWr;
	reg RegDst;
	reg MemRead;
	reg MemWrite;
	reg MemToReg;
	reg Alusrc;
	reg Br;
	reg [4:0] shamt;
	//reg [3:0] AluControl;
	
	always @(Op)
		begin
			if(Op ==6'b000000 ) //R-Type
				begin
					RegDst=1'b1;
					RegWr=1'b1;
            		MemRead=1'b0;
            		MemWrite=1'b0;
            		Aluop=3'b000;
            		//AluControl=4'b0010;
            		Alusrc=1'b0;
            		Br=1'b0;
		            MemToReg=1'b0;
				end 
			else if(Op==6'b100011) //lw
				begin
					RegDst=1'b0;
				    RegWr=1'b1;
				    MemRead=1'b1;
		            MemWrite=1'b0;
				    Aluop=3'b001;
			       	//AluControl=4'b0010;
				   	Alusrc=1'b1;
				 	Br=1'b0;
					MemToReg=1'b0;
				end 	
			else if(Op==6'b101011) //sw
				begin
					RegDst=1'b0;
					RegWr=1'b1;
					MemRead=1'b1;
					MemWrite=1'b0;	
					Aluop=3'b001;
					//AluControl=4'b0010;
					Alusrc=1'b1;
					Br=1'b0;
					MemToReg=1'b0;
				end
			else if(Op==6'b001100)	 //andi	
				begin
					RegDst=1'b0;
					RegWr=1'b1;
					MemRead=1'b0;
					MemWrite=1'b0;
					Aluop=3'b011;
					//AluControl=4'b0010;
					Alusrc=1'b1;
					Br=1'b0;
					MemToReg=1'b0;
				end
			else if(Op==6'b001000) //addi	
				begin
					RegDst=1'b0;
					RegWr=1'b1;
					MemRead=1'b0;
					MemWrite=1'b0;
					Aluop=3'b010;
					//AluControl=4'b0010;
					Alusrc=1'b1;
					Br=1'b0;
					MemToReg=1'b0;
				end	
			else if(Op==6'b000100) //beq
				begin
					RegDst=1'bx;
					RegWr=1'b0;
					MemRead=1'b0;
					MemWrite=1'b0;
					Aluop=3'b100;
					//AluControl=4'b0010;
					Alusrc=1'b1;
					Br=1'b1;
					MemToReg=1'b0;
				end
		end
endmodule
