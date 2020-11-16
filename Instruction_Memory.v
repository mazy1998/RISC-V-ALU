module Instruction_Memory
(
	input [63:0] inst_address,
	output reg [31:0] instruction
);

	reg [7:0] memory [15:0];
	initial
		begin
		memory[0] = 8'b10110011;
		memory[1] = 8'b10000000;
		memory[2] = 8'b00100001;
		memory[3] = 8'b00000000;
		memory[4] = 8'b00110011;
		memory[5] = 8'b10000010;
		memory[6] = 8'b00010010;
		memory[7] = 8'b00000000;
		memory[8] = 8'b10010011;
		memory[9] = 8'b10000100;
		memory[10] = 8'b00010100;
		memory[11] = 8'b00000000;
		memory[12] = 8'b00100011;
		memory[13] = 8'b00110100;
		memory[14] = 8'b10010101;
		memory[15] = 8'b00000010;
		end
		
	always @ (inst_address)
	begin
		instruction = {memory[inst_address+3], memory[inst_address+2], memory[inst_address+1],
		memory[inst_address]};
	end
	
endmodule