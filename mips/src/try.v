
module try (Out);
	
	output[1:0] Out;
	reg [1:0] temp=2'b11;
	
	wire w;
	
	  assign w = temp;
	 assign Out=w;
		
endmodule
