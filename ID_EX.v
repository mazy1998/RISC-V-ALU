module ID_EX
(
	//INPUT!!

	//Control Signals
	input clk, reset, 
	input ID_EX_ALUSrc, 
	input ID_EX_Branch, 
	input ID_EX_MemRead, 
	input ID_EX_RegWrite,
	input ID_EX_MemToReg,
	input ID_EX_MemWrite,
	input [1:0] ID_EX_ALUOp,
	//


	input [63:0] ID_EX_PC_Out, ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_imm_data,
	input [4:0] ID_EX_rs1, ID_EX_rs2, ID_EX_rd,
	input [3:0] ID_EX_instruction,

	//OUTPUTS!!!

	//Control Signals
	output reg ID_EX_output_MemWrite,
	output reg ID_EX_output_ALUSrc, 
	output reg ID_EX_output_Branch,
	output reg ID_EX_output_MemRead,
	output reg ID_EX_output_RegWrite,
	output reg ID_EX_output_MemToReg,
	output reg [1:0] ID_EX_output_ALUOp,

	output reg [63:0] ID_EX_a, ID_EX_output_imm_data, ID_EX_output_ReadData1, ID_EX_output_ReadData2, 
	output reg [4:0] ID_EX_output_rs1, ID_EX_output_rs2, ID_EX_output_rd,
	output reg [3:0] ID_EX_funct
	
);
	always @ (posedge clk)
		begin
			if (reset)
				begin
					ID_EX_output_ALUOp = 0;
					ID_EX_output_ALUSrc = 0;
					ID_EX_output_Branch = 0;
					ID_EX_output_MemRead = 0;
					ID_EX_output_RegWrite = 0;
					ID_EX_output_MemWrite = 0;
					ID_EX_output_MemToReg = 0;
					ID_EX_output_ReadData1 = 0;
					ID_EX_output_ReadData2 = 0;
					ID_EX_output_imm_data = 0;
					ID_EX_output_rd = 0;
					ID_EX_funct = 0;
					ID_EX_output_rs1 = 0;
					ID_EX_output_rs2 = 0;
					ID_EX_a = 0;
				end
			else if (clk)
				begin
					ID_EX_output_ALUOp = ID_EX_ALUOp;
					ID_EX_output_ALUSrc = ID_EX_ALUSrc;
					ID_EX_output_Branch = ID_EX_Branch;
					ID_EX_output_MemRead = ID_EX_MemRead;
					ID_EX_output_RegWrite = ID_EX_RegWrite;
					ID_EX_output_MemWrite = ID_EX_MemWrite;
					ID_EX_output_MemToReg = ID_EX_MemToReg;
					ID_EX_output_ReadData1 = ID_EX_ReadData1;
					ID_EX_output_ReadData2 = ID_EX_ReadData2;
					ID_EX_output_imm_data = ID_EX_imm_data;
					ID_EX_output_rd = ID_EX_rd;
					ID_EX_funct = ID_EX_instruction;
					ID_EX_output_rs1 = ID_EX_rs1;
					ID_EX_output_rs2 = ID_EX_rs2;
					ID_EX_a = ID_EX_PC_Out;
				end
		end

endmodule
		