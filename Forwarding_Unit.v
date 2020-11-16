module Forwarding_Unit
(
	input [4:0] ID_EX_Rs1, ID_EX_Rs2,
	input [4:0] EX_MEM_Rd,
	input EX_MEM_RegWrite,
	input [4:0] MEM_WB_Rd,
	input MEM_WB_RegWrite,
	output reg [1:0] Forward_A, Forward_B
);

	always @ (*)
		begin
		
		//For Forward A
		if (EX_MEM_Rd == ID_EX_Rs1 & EX_MEM_RegWrite == 1 & EX_MEM_Rd != 0)
			begin
				Forward_A = 2'b10;
			end
		else if (MEM_WB_Rd == ID_EX_Rs1 & MEM_WB_RegWrite == 1 & MEM_WB_Rd != 0 
				&
				!(EX_MEM_RegWrite == 1 & EX_MEM_Rd != 0 & EX_MEM_Rd == ID_EX_Rs1)
				)
			begin
				Forward_A = 2'b01;
			end
		else
			begin
				Forward_A = 2'b00;
			end
		
		
		//For Forward B
		if (EX_MEM_Rd == ID_EX_Rs2 & EX_MEM_RegWrite == 1 & EX_MEM_Rd != 0)
			begin
				Forward_B = 2'b10;
			end
		else if (MEM_WB_Rd == ID_EX_Rs2 & MEM_WB_RegWrite == 1 & MEM_WB_Rd != 0 
				&
				!(EX_MEM_RegWrite == 1 & EX_MEM_Rd != 0 & EX_MEM_Rd == ID_EX_Rs2)
				)
			begin
				Forward_B = 2'b01;
			end
		else 
			begin
				Forward_B = 2'b00;
			end
		
		end

endmodule