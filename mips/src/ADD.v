module ADD (Out1, In3, In4);


input wire [31:0] In3, In4;
output reg [31:0] Out1;

always @(In3 or In4)
Out1 = In3 + In4;
endmodule
