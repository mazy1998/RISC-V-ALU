module immediate_data
(
	input [31:0] instruction,
	output reg [63:0] imm_data
);

	reg [6:0] opcode;
	//reg [51:0] sign = {52{instruction[31]}};
	
	always @ (instruction)
			begin 
				case (instruction[6:0])
				//addi
				7'b0010011: imm_data = {{52{instruction[31]}},instruction[31:20]};
				//ld
				7'b0000011: imm_data = {{52{instruction[31]}},instruction[31:20]};
				//sd
				7'b0100011: imm_data = {{52{instruction[31]}},instruction[31:25], instruction[11:7]};
				//branch
				7'b1100111: imm_data = {{52{instruction[31]}}, instruction[11:8], instruction[30:25], instruction[7], instruction[31]};
				endcase
			end
endmodule			