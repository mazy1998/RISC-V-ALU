module Data_memory
(
	input clk, memWrite, memRead,
	input [63:0] mem_address, write_data,
	output reg [63:0] read_data
);

	reg [7:0] dm [63:0];
	initial
		begin
		dm[0]= 8'b01010110;
		dm[1]= 8'b10110001; // 177
		dm[2]= 8'b11011110; // 222
		dm[3]= 8'b01100001; // 97
		dm[4]= 8'b11010110; // 214
		dm[5]= 8'b00000110; // 6
		dm[6]= 8'b01010010;
		dm[7]= 8'b01001100;
		dm[8]= 8'b01110010;
		dm[9]= 8'b01000100;
		dm[10]= 8'b00111000;
		dm[11]= 8'b10110000;
		dm[12]= 8'b00100001;
		dm[13]= 8'b10111000;
		dm[14]= 8'b10110011;
		dm[15]= 8'b11000000;
		dm[16]= 8'b00010111;
		dm[17]= 8'b10110110;
		dm[18]= 8'b10111111;
		dm[19]= 8'b11111111;
		dm[20]= 8'b10001100;
		dm[21]= 8'b10100100;
		dm[22]= 8'b01010111;
		dm[23]= 8'b01111000;
		dm[24]= 8'b00100010;
		dm[25]= 8'b11111011;
		dm[26]= 8'b10111011;
		dm[27]= 8'b10001110;
		dm[28]= 8'b01111000;
		dm[29]= 8'b10001000;
		dm[30]= 8'b10110110;
		dm[31]= 8'b10011101;
		dm[32]= 8'b11011001;
		dm[33]= 8'b00100011;
		dm[34]= 8'b11011101;
		dm[35]= 8'b11011110;
		dm[36]= 8'b10111001;
		dm[37]= 8'b11000001;
		dm[38]= 8'b11111010;
		dm[39]= 8'b10101000;
		dm[40]= 8'b00111000;
		dm[41]= 8'b01001101;
		dm[42]= 8'b11000101;
		dm[43]= 8'b00100011;
		dm[44]= 8'b10011000;
		dm[45]= 8'b00110110;
		dm[46]= 8'b01001000;
		dm[47]= 8'b11111010;
		dm[48]= 8'b10111101;
		dm[49]= 8'b10100010;
		dm[50]= 8'b00000001;
		dm[51]= 8'b00000000;
		dm[52]= 8'b00000000;
		dm[53]= 8'b00000000;
		dm[54]= 8'b00000000;
		dm[55]= 8'b00000000;
		dm[56]= 8'b00000000;
		dm[57]= 8'b00000000;
		dm[58]= 8'b10000101;
		dm[59]= 8'b00111000;
		dm[60]= 8'b01000100;
		dm[61]= 8'b01010100;
		dm[62]= 8'b00001100;
		dm[63]= 8'b11011001;
		end
	
	always @ (posedge clk)
	begin
		if (memWrite)
			{dm[mem_address+7], dm[mem_address+6], dm[mem_address+5],
		dm[mem_address+4], dm[mem_address+3], dm[mem_address+2], dm[mem_address+1],
		dm[mem_address]} = write_data;
		
	end
	
	always @ (mem_address or memRead or dm)
	begin
		if (memRead)
			read_data = {dm[mem_address+7], dm[mem_address+6], dm[mem_address+5],
		dm[mem_address+4], dm[mem_address+3], dm[mem_address+2], dm[mem_address+1],
		dm[mem_address]};
	end
	
endmodule
		
		
		
		
		
		
		
		
		
		