module tb
(

);
	reg clk,reset;
	
	RISC_V_Processor_Pipelined R5
	(
		.clk(clk),
		.reset(reset)
	);
	
	initial
	clk = 1'b0;
	
	always
	#5 clk = ~clk;
	initial
	begin
	reset = 1'b1;
	#2 reset = 0;
	end
	
endmodule