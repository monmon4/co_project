module ALU (Out,Zero,In1,In2,Ctrl) ;
	input[31:0]In1,In2;
	output reg[31:0]Out;
	input[2:0]Ctrl;
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
 always @( Ctrl or In1 or In2 )
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
				if (In1==In2)
						begin	
							Out=0;
							Zero=1;
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


module ALU_tb;
	reg [31:0]In1,In2;
	reg [2:0]Ctrl;
	wire [31:0]Out;
	wire Zero;
	ALU U0(.Out(Out),.Zero(Zero),.In1(In1),.In2(In2),.Ctrl(Ctrl));
	initial
		begin
			In1=5'b11101;		 //add 29+21
			In2=5'b10101;
			Ctrl=3'b000;
			
			#70 In1=5'b01100;	 //lw 12,11
			#0 In2=5'b01011;
			#0 Ctrl=3'b001;
			
			#70 In1=5'b00000;	//	add 0+3
			#0 In2=5'b00011;
			#0 Ctrl= 3'b000;
			
			#70 In1=5'b01100;	   // and1 
			#0 In2=5'b01011;
			#0 Ctrl= 3'b011;	
			
			#70 In1=5'b00101;  //nor1
			#0 In2=5'b01001;
			#0 Ctrl= 3'b100;	
			
			#70 In1=5'b00100;	// sll 4,7
			#0 In2=5'b00111;
			#0 Ctrl= 3'b101;
			
			#70 In1=5'b00001;	//beq 1,1
			#0 In2=5'b00001;
			#0 Ctrl= 3'b110;	  
			
			#70 In1=5'b00000;	//slt 0,3
			#0 In2=5'b00011;
			#0 Ctrl= 3'b111;
			
			#20 $finish	;
		end
endmodule
	

