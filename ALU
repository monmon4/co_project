module ALU(Out,Zero,In1,In2,Ctrl) ;
	input[31:0]In1,In2;
	output reg[31:0]Out;
	input[3:0]Ctrl;
	output reg Zero;
	parameter [2:0]	
	add=3'b000,
	lw=3'b001,
	sw=3'b010,
	and1=3'b011,
	nor1=3'b100,
	sll=3'b101,
	beq=3'b110,
	slt=3'b111;
 always @( Ctrl , In1 , In2 )
	begin  
		case(Ctrl)
			add: begin
				Out=In1+In2;
				if(Out==0)
					Zero=1;
				else
					Zero=0;
				end
			lw: begin
				Out=In1+In2;
				if(Out==0)
					Zero=1;
				else
					Zero=0;
				end
			and1: begin
				Out=In1&In2;
				if(Out==0)
					Zero=1;
				else
					Zero=0;
				end
			nor1: begin
				Out=~(In1|In2);
				if(Out==0)
					Zero=1;
				else
					Zero=0;
				end
			sll: begin
				Out=In1<<In2;
				if(Out==0)
					Zero=1;
				else
					Zero=0;
				end
			beq: begin
					if ((In1-In2)==0)	
						begin	
							Out=0;
				if(Out==0)
					Zero=1;
				else
					Zero=0;
						end
				end
			slt: begin
				if(In1<In2)	Out=1;
				else	Out=0;
				if(Out==0)
					Zero=1;
				else
					Zero=0;
				end
		endcase
	end
endmodule	
