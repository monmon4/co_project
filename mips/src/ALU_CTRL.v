 module ALU_CTRL(Ctrl,Func,Aluop)  ;
	input[5:0]Func;
	input[2:0]Aluop;
	output reg[2:0]Ctrl;
	parameter[2:0]
	add=3'b000,
	lw=3'b001,
	sw=3'b010,
	and1=3'b011,
	nor1=3'b100,
	sll=3'b101,
	beq=3'b110,
	slt=3'b111;
	parameter[5:0]
	f_add= 6'b100000,
	f_and=	6'b100010,
	f_nor=	6'b100100,
	f_sll=	6'b000000,
	f_slt=	6'b101010;
	always@(Func or Aluop)
		begin
			if (Aluop==3'b000)
				begin
					case(Func)
						f_add : Ctrl=add;
						f_and : Ctrl=and1;
						f_nor : Ctrl=nor1;
						f_sll : Ctrl=sll;
						f_slt : Ctrl=slt;
					endcase
				end
			else if(Aluop==3'b001)
				Ctrl=lw;
			else if (Aluop==3'b010)
				Ctrl=add;
			else if (Aluop==3'b011)
				Ctrl=and1;
			else if (Aluop==3'b110)
				Ctrl=beq;
		end
					 
 endmodule
