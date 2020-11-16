module RISC_V_Processor
(
	input clk,
	input reset
);

	wire [63:0] PC_Out_wire, mux1_data_out_wire, Adder1_out_wire, Adder2_out_wire, RegFile_rd1_wire, RegFile_rd2_wire, immediate_data_wire, Result_wire, data_mem_readdata_wire, mux2_dataout_wire, mux3_data_out_wire;
	wire [31:0] instruction_memory_wire;
	wire [6:0] opcode_wire, funct7_wire;
	wire [4:0] rd_wire ,rs1_wire ,rs2_wire;
	wire [3:0] Operation_wire;
	wire [2:0] fucnt3_wire;
	wire [1:0] ALUOp_wire;
	wire Branch_wire ,MemRead_wire, MemtoReg_wire, MemWrite_wire, ALUSrc_wire, RegWrite_wire, zero_wire;
	

	
	adder add1
	(
		.a(PC_Out_wire),
		.b(64'd4),
		.out(Adder1_out_wire)
	);
	
	
	
	Instruction_Memory im
	(
		.inst_address(PC_Out_wire),
		.instruction(instruction_memory_wire)
	);
	
	instruction_parser ip
	(
		.instruction(instruction_memory_wire),
		.opcode(opcode_wire),
		.funct7(funct7_wire),
		.rd(rd_wire),
		.rs1(rs1_wire),
		.rs2(rs2_wire),	
		.fucnt3(fucnt3_wire)
	);
	
	Control_Unit cu
	(	
		.Opcode(opcode_wire),
		.ALUOp(ALUOp_wire),
		.Branch(Branch_wire),
		.MemRead(MemRead_wire),
		.MemtoReg(MemtoReg_wire),
		.MemWrite(MemWrite_wire),
		.ALUSrc(ALUSrc_wire),
		.RegWrite(RegWrite_wire)
		
	);
	
	registerFile rf
	(
		.WriteData(mux2_dataout_wire),
		.RS1(rs1_wire),
		.RS2(rs2_wire),
		.RD(rd_wire),
		.RegWrite(RegWrite_wire), 
		.clk(clk),
		.reset(reset),
		.ReadData1(RegFile_rd1_wire),
		.ReadData2(RegFile_rd2_wire)
	);
	
	immediate_data imd
	(
		.instruction(instruction_memory_wire),
		.imm_data(immediate_data_wire)
	);
	
	adder add2
	(
		.a(PC_Out_wire),
		.b(immediate_data_wire<<<1),
		.out(Adder2_out_wire)
	);
	
	multiplexer mux3
	(
		.data_out(mux3_data_out_wire),
		.a(RegFile_rd2_wire), 
		.b(immediate_data_wire),
		.sel(ALUSrc_wire)
	);
		

	
	ALU_Control ALU_C
	(
		.ALUOp(ALUOp_wire),
		.Funct({instruction_memory_wire[30],instruction_memory_wire[14:12]}),
		.Operation(Operation_wire)
	);
	
	ALU_64_bit al
	(
		.a(RegFile_rd1_wire),
		.b(mux3_data_out_wire),
		.ALUOp(Operation_wire),
		.Result(Result_wire),
		.zero(zero_wire)
	);
	
	Data_memory dm
	(
		.clk(clk),
		.memWrite(MemWrite_wire),
		.memRead(MemRead_wire),
		.mem_address(Result_wire),
		.write_data(RegFile_rd2_wire),
		.read_data(data_mem_readdata_wire)
	);
	
	multiplexer mux2
	(
		.data_out(mux2_dataout_wire),
		.sel(MemtoReg_wire),
		.b(data_mem_readdata_wire),
		.a(Result_wire)		
	);
	
	multiplexer mux1
	(
		.data_out(mux1_data_out_wire),
		.a(Adder1_out_wire),
		.b(Adder2_out_wire),
		.sel(Branch_wire && zero_wire)
		
	);
	Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(mux1_data_out_wire),
		.PC_Out(PC_Out_wire)
	);
endmodule	

