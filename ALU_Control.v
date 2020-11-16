module ALU_Control
(
	input [1:0] ALUOp,
	input [3:0] Funct,
	output reg [3:0] Operation
	
);


	always @(ALUOp)
		begin
			case(ALUOp)
				2'b00: 
				  begin
				    Operation = 4'b0010; 
				  end
				
				2'b01: 
				  begin
				    Operation = 4'b0110; 
				  end
				  
				2'b10: 
				  begin
					case(Funct)
						4'b0000: Operation = 4'b0010;
						4'b1000: Operation = 4'b0110;
						4'b0111: Operation = 4'b0000;
						4'b0110: Operation = 4'b0001;
					endcase
				  end
				  
			endcase
		end

endmodule