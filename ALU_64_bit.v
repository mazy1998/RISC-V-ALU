module ALU_64_bit
(
	input [63:0] a,b,
	input [3:0] ALUOp,
	output reg [63:0] Result,
	output reg zero
);

always @ (ALUOp or a or b)
		begin
			case (ALUOp[3:0])
				//And
				4'b0000: Result <= a & b;
				//Or
				4'b0001: Result <= a | b;
				//Add
				4'b0010: Result <= a + b;
				//Sub
				4'b0110: Result <= a - b;
				//Nor
				4'b1100: Result <= ~(a | b);
			endcase
			
			if (Result == 0)
				zero = 1;
			else
				zero = 0;
		end
endmodule