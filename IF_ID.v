module IF_ID
(
	input clk, reset,
	input [63:0] IF_ID_PC_Out,
	input[31:0] IF_ID_instruction,
	output reg [63:0] IF_ID_out,
	output reg [31:0] IF_ID_instruction_out
);
	always @ (posedge clk or reset)
		begin
			if (reset)
			begin
			IF_ID_instruction_out = 0;
			IF_ID_out = 0;
			end
			
			else if (clk)
				begin
					IF_ID_out = IF_ID_PC_Out; 
					IF_ID_instruction_out = IF_ID_instruction;
				end
		end

endmodule
		