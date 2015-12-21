module ADD (Out1, In3, In4, Clk);

input wire Clk, In3, In4;
output reg Out1;

always @(posedge Clk)
Out1 = In3 + In4;
endmodule
