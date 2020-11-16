module EX_MEM
(
	//INPUTS!!


	//Control signals
	input EX_MEM_Branch,
	input EX_MEM_RegWrite,
	input EX_MEM_MemToReg,
	input EX_MEM_MemRead,
	input EX_MEM_MemWrite,
	input EX_MEM_Zero,
	//

	input clk, reset,
	input [4:0] EX_MEM_Rd,
	input [63:0] EX_MEM_Lower_Forwarding_MUX_out, EX_MEM_ALU_result, EX_MEM_Adder,
	

	//OUTPUTS!!

	//Control signals
	output reg EX_MEM_output_Branch,
	output reg EX_MEM_output_RegWrite,
	output reg EX_MEM_output_MemToReg,
	output reg EX_MEM_output_MemRead,
	output reg EX_MEM_output_MemWrite,
	output reg EX_MEM_output_zero,
	//

	output reg [63:0] EX_MEM_Adder_output, EX_MEM_Lower_Forwarding_MUX_output, EX_MEM_ALU_result_output,
	output reg [4:0] EX_MEM_output_rd
);

	always @(posedge clk or reset)
		begin
			if (reset)
				begin
					EX_MEM_output_rd = 0;
					EX_MEM_Lower_Forwarding_MUX_output = 0;
					EX_MEM_ALU_result_output = 0;
					EX_MEM_output_zero = 0;
					EX_MEM_Adder_output = 0;
					EX_MEM_output_Branch = 0;
					EX_MEM_output_MemRead = 0;
					EX_MEM_output_MemWrite = 0;
					EX_MEM_output_RegWrite = 0;
					EX_MEM_output_MemToReg = 0;
				end
			else if (clk)
				begin
					EX_MEM_output_rd = EX_MEM_Rd;
					EX_MEM_Lower_Forwarding_MUX_output = EX_MEM_Lower_Forwarding_MUX_out;
					EX_MEM_ALU_result_output = EX_MEM_ALU_result;
					EX_MEM_Adder_output = EX_MEM_Adder;
					EX_MEM_output_zero = EX_MEM_Zero;
					EX_MEM_output_Branch = EX_MEM_Branch;
					EX_MEM_output_MemRead = EX_MEM_MemRead;
					EX_MEM_output_MemWrite = EX_MEM_MemWrite;
					EX_MEM_output_RegWrite = EX_MEM_RegWrite;
					EX_MEM_output_MemToReg = EX_MEM_MemToReg;
				end
		end

endmodule

