module mux_4_in
(
	input [63:0] a, b, c, d,
	input [1:0] sel,
	output reg [63:0] data_out

);

	always @(*)
	begin
		
		if (sel == 2'b00)
			begin
				data_out = a; 
			end
			
		else if (sel == 2'b01)
			begin
				data_out = b;
			end
		
		else if (sel == 2'b10)
			begin
				data_out = c;
			end
		
		else if (sel == 2'b11)
			begin
				data_out = d;
			end
			
	end

endmodule