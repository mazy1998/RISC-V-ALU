module multiplexer
(
	output reg [63:0] data_out,
	input [63:0] a, b,
	input sel
	
);

	always @ (sel or a or b)
		begin
			case(sel)
				0: data_out = a;
				1: data_out = b;
			endcase	
		end
endmodule