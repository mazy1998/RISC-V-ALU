module MEM_WB
(
	//INPUTS!!


	//Control signals
	input MEM_WB_RegWrite,
	input MEM_WB_MemToReg,
	//

	input clk, reset,
	input [4:0] MEM_WB_Rd,
	input [63:0] MEM_WB_ReadData, MEM_WB_ALU_result,
	

	//OUTPUTS!!

	//Control signals
	output reg MEM_WB_output_RegWrite,
	output reg MEM_WB_output_MemToReg,
	//

	output reg [63:0] MEM_WB_ALU_result_output, MEM_WB_ReadData_output,
	output reg [4:0] MEM_WB_output_rd
);

	always @(posedge clk or reset)
		begin
			if (reset)
				begin
					MEM_WB_output_rd = 0;
					MEM_WB_ALU_result_output = 0;
					MEM_WB_ReadData_output = 0;
					MEM_WB_output_RegWrite = 0;
					MEM_WB_output_MemToReg = 0;
				end
			else if (clk)
				begin
					MEM_WB_output_rd = MEM_WB_Rd;
					MEM_WB_ALU_result_output = MEM_WB_ALU_result;
					MEM_WB_ReadData_output = MEM_WB_ReadData;
					MEM_WB_output_RegWrite = MEM_WB_RegWrite;
					MEM_WB_output_MemToReg = MEM_WB_MemToReg;
				end
		
		end

endmodule

